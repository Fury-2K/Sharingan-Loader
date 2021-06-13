//
//  SharinganLoader.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 28/05/21.
//

import SwiftUI

public struct SharinganLoader: View {
    /// Diameter of the sharingan eye.
    @State private var diameter: CGFloat
    /// Time taken for the eye to complete 1 full rotation.
    var animationDuration: Double
    /// Black background intensity.
    var backgroundDarkness: Double
    
    @Binding var isVisible: Bool
    
    @State private var rotationDegree: Double = 0
    @State private var tomoe1Opacity: Double = 0
    @State private var tomoe2Opacity: Double = 0
    @State private var isMangekyou: Bool = false
    
    // MARK: - Initialization
    
    public init(diameter: CGFloat = 100,
                animationDuration: Double = 1,
                backgroundDarkness: Double = 0.2,
                isVisible: Binding<Bool>) {
        self.diameter = diameter
        self.animationDuration = animationDuration
        self.backgroundDarkness = backgroundDarkness
        self._isVisible = isVisible
    }
    
    // MARK: - View
    
    public var body: some View {
        guard isVisible else {return AnyView(EmptyView()) }
        return AnyView(
            ZStack {
                // Background
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                // Loader
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
                    
                    // Inner ring
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.2)
                            .frame(width: diameter * 0.621, height: diameter * 0.621, alignment: .center)
                        
                        Circle()
                            .foregroundColor(.shariRed)
                            .frame(width: diameter * 0.606, height: diameter * 0.606, alignment: .center)
                        
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
                        
                        TomoeView(diameter: $diameter, isMangekyou: $isMangekyou)
                            .rotationEffect(.degrees(150))
                            .offset(x: isMangekyou ? 0 : -(diameter * 0.196), y: isMangekyou ? 0 : -(diameter * 0.257))
                        
                        Circle()
                            .foregroundColor(isMangekyou ? .shariRed : .black)
                            .frame(width: diameter * 0.151, height: diameter * 0.151, alignment: .center)
                    }
                    .onAppear() {
                        withAnimation(Animation.easeOut(duration: animationDuration).repeatForever(autoreverses: false)) {
                            rotationDegree -= 360
                        }
                        addRotationAnimation()
                        addMangekyouSpringAnimation()
                    }
                    .rotationEffect(.degrees(rotationDegree))
                }
            }
        )
    }
    
    private func addRotationAnimation() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 2.5), repeats: false) { _ in
            withAnimation(Animation.easeIn(duration: animationDuration * 0.2)) {
                diameter = diameter * 0.7
            }
        }
    }
    
    private func addMangekyouSpringAnimation() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 3), repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                isMangekyou.toggle()
            }
        }
        Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 2.7), repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: animationDuration * 0.3)) {
                diameter = diameter * 1.3
            }
        }
    }
}
