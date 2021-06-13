//
//  SharinganLoader.swift
//  SharinganLoader
//
//  Created by Manas Aggarwal on 28/05/21.
//

import SwiftUI

public struct SharinganLoader: View {
    /// Time taken for the eye to complete 1 full rotation.
    private var animationDuration: Double
    /// Black background intensity.
    private var backgroundDarkness: Double
    /// Switch to repeat mangekyou animation infinitely.
    private var repeatMangekyouAnimation: Bool
    
    @Binding private var isVisible: Bool
    
    /// Diameter of the sharingan eye.
    @State private var diameter: CGFloat
    @State private var rotationDegree: Double = 0
    @State private var tomoe1Opacity: Double = 0
    @State private var tomoe2Opacity: Double = 0
    @State private var isMangekyou: Bool = false
    
    private var bounceIntensity: CGFloat
    private var oldDiameterValue: CGFloat
    private var shouldTransformToMangekyou: Bool
    
    // MARK: - Initialization
    
    public init(diameter: CGFloat = 100,
                animationDuration: Double = 1,
                backgroundDarkness: Double = 0.2,
                isVisible: Binding<Bool>,
                shouldTransformToMangekyou: Bool = true) {//,
//                repeatMangekyouAnimation: Bool = true) {
        self.diameter = diameter
        self.animationDuration = animationDuration
        self.backgroundDarkness = backgroundDarkness
        self._isVisible = isVisible
        self.shouldTransformToMangekyou = shouldTransformToMangekyou
        self.repeatMangekyouAnimation = false//repeatMangekyouAnimation
        
        self.bounceIntensity = diameter * 0.3
        self.oldDiameterValue = diameter
    }
    
    // MARK: - View
    
    public var body: some View {
        guard isVisible else {return AnyView(EmptyView()) }
        return AnyView(
            ZStack {
                // MARK: Background
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                // MARK: Loader View
                ZStack {
                    Circle()
                        .frame(width: diameter, height: diameter, alignment: .center)
                        .foregroundColor(.black)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .shadow(radius: 5)
                        .shadow(radius: 5)
                        .animation(.interpolatingSpring(stiffness: 10, damping: 2))
                    
                    Circle()
                        .foregroundColor(.shariRed)
                        .frame(width: diameter * 0.969, height: diameter * 0.969, alignment: .center)
                        .animation(.interpolatingSpring(stiffness: 10, damping: 2))
                    
                    // MARK: Inner Eye
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.2)
                            .frame(width: diameter * 0.621, height: diameter * 0.621, alignment: .center)
                        
                        Circle()
                            .foregroundColor(.shariRed)
                            .frame(width: diameter * 0.606, height: diameter * 0.606, alignment: .center)
                        
                        /// First tomoe
                        TomoeView(diameter: $diameter, isMangekyou: $isMangekyou)
                            .rotationEffect(.degrees(150))
                            .offset(x: isMangekyou ? 0 : -(diameter * 0.196), y: isMangekyou ? 0 : -(diameter * 0.257))
                        
                        /// Second tomoe
                        TomoeView(diameter: $diameter, isMangekyou: $isMangekyou)
                            .rotationEffect(.degrees(30))
                            .offset(x: isMangekyou ? 0 : -(diameter * 0.196), y: isMangekyou ? 0 : diameter * 0.257)
                            .opacity(tomoe1Opacity)
                            .onAppear() {
                                Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration), repeats: false) { _ in
                                    withAnimation(Animation.easeIn(duration: 1.5)) {
                                        tomoe1Opacity = 1
                                    }
                                }
                            }
                        
                        /// Thrid tomoe
                        TomoeView(diameter: $diameter, isMangekyou: $isMangekyou)
                            .rotationEffect(.degrees(-90))
                            .offset(x: isMangekyou ? 0 : diameter * 0.318, y: 0)
                            .opacity(tomoe2Opacity)
                            .onAppear() {
                                Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 2), repeats: false) { _ in
                                    withAnimation(Animation.easeIn(duration: 1.5)) {
                                        tomoe2Opacity = 1
                                    }
                                }
                            }
                        
                        /// Inner circle
                        Circle()
                            .foregroundColor(isMangekyou ? .shariRed : .black)
                            .frame(width: diameter * 0.151, height: diameter * 0.151, alignment: .center)
                    }
                    .onAppear() {
                        addRotationAnimation()
                        transformToMangekyou()
                        if shouldTransformToMangekyou {
                            addMangekyouSpringAnimation()
                        }
                    }
                    .rotationEffect(.degrees(rotationDegree))
                }
            }
        )
    }
    
    private func addRotationAnimation() {
        withAnimation(Animation.easeOut(duration: animationDuration).repeatForever(autoreverses: false)) {
            rotationDegree -= 360
        }
    }
    
    private func transformToMangekyou() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 4), repeats: repeatMangekyouAnimation) { _ in
            withAnimation(Animation.easeInOut(duration: animationDuration * 0.5)) {
                isMangekyou.toggle()
            }
        }
    }
    
    private func addMangekyouSpringAnimation() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 3.5), repeats: repeatMangekyouAnimation) { _ in
            withAnimation(Animation.easeIn(duration: animationDuration * 0.2)) {
                diameter -= bounceIntensity
            }
        }
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 3.7), repeats: repeatMangekyouAnimation) { _ in
            withAnimation(Animation.easeOut(duration: animationDuration * 0.3)) {
                diameter = oldDiameterValue
            }
        }
    }
}
