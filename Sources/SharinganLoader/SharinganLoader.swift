//
//  SharinganLoader.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 28/05/21.
//

import SwiftUI

public struct SharinganLoader: View {
    /// Diameter of the sharingan eye.
    var diameter: CGFloat
    /// Time taken for the eye to complete 1 full rotation.
    var animationDuration: Double
    /// Black background intensity.
    var backgroundDarkness: Double
    
    @Binding var isVisible: Bool
    
    @State private var rotationDegree: Double = 0
    @State private var tomoe1Opacity: Double = 0
    @State private var tomoe2Opacity: Double = 0
    
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
                Color.black
                    .opacity(backgroundDarkness)
                    .ignoresSafeArea()
                
                Circle()
                    .frame(width: diameter, height: diameter, alignment: .center)
                    .foregroundColor(.black)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .shadow(radius: 5)
                    .shadow(radius: 5)
                
                Circle()
                    .foregroundColor(.shariRed)
                    .frame(width: diameter * 0.969, height: diameter * 0.969, alignment: .center)
                
                // Inner ring
                ZStack {
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.3)
                        .frame(width: diameter * 0.621, height: diameter * 0.621, alignment: .center)
                    
                    Circle()
                        .foregroundColor(.shariRed)
                        .frame(width: diameter * 0.606, height: diameter * 0.606, alignment: .center)
                    
                    Circle()
                        .frame(width: diameter * 0.151, height: diameter * 0.151, alignment: .center)
                    
                    TomoeView(radius: diameter * 0.242)
                        .rotationEffect(.degrees(30))
                        .offset(x: -(diameter * 0.196), y: diameter * 0.257)
                        .opacity(tomoe1Opacity)
                        .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration), repeats: false) { _ in
                                withAnimation(Animation.easeIn(duration: 1.5)) {
                                    tomoe1Opacity = 1
                                }
                            }
                        }
                    
                    TomoeView(radius: diameter * 0.242)
                        .rotationEffect(.degrees(-90))
                        .offset(x: diameter * 0.318, y: 0)
                        .opacity(tomoe2Opacity)
                        .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: TimeInterval(animationDuration * 2), repeats: false) { _ in
                                withAnimation(Animation.easeIn(duration: 1.5)) {
                                    tomoe2Opacity = 1
                                }
                            }
                        }
                    
                    
                    TomoeView(radius: diameter * 0.242)
                        .rotationEffect(.degrees(150))
                        .offset(x: -(diameter * 0.196), y: -(diameter * 0.257))
                }
                .onAppear() {
                    withAnimation(Animation.easeOut(duration: animationDuration).repeatForever(autoreverses: false)) {
                        rotationDegree += 360
                    }
                }
                .rotationEffect(.degrees(rotationDegree))
            }
        )
    }
}
