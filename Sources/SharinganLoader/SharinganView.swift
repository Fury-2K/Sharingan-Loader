//
//  SharinganView.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 28/05/21.
//

import SwiftUI

public struct SharinganView: View {
    var diameter: CGFloat
    var animationDuration: Double = 1
    
//    @Binding var showingLoader: Bool
    @State private var rotationDegree: Double = 0
    @State private var tomoe1Opacity: Double = 0
    @State private var tomoe2Opacity: Double = 0
    
    public init(diameter: CGFloat, animationDuration: Double = 1){//}, showingLoader: Binding<Bool>) {
        self.diameter = diameter
        self.animationDuration = animationDuration
//        _showingLoader = showingLoader
    }
    
    public var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
//                .onTapGesture {
//                    showingLoader.toggle()
//                }
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
    }
}

struct SharinganView_Previews: PreviewProvider {
    static var previews: some View {
        SharinganView(diameter: 150)//, showingLoader: <#T##Binding<Bool>#>)
    }
}
