//
//  TomoeView.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 17/04/21.
//

import SwiftUI

struct Tomoe: Shape {
    @Binding var isMangekyou: Bool
    
    let screenCenter = UIScreen.main.bounds.midX
    let mainCircleCenter: CGPoint = CGPoint(x: UIScreen.main.bounds.midX - 10, y: UIScreen.main.bounds.midY + 7)
    let a: CGPoint = CGPoint(x: UIScreen.main.bounds.midX - 10, y: UIScreen.main.bounds.midY + 17)
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // MARK:- Shit tomoe 1
        
        //            path.move(to: CGPoint(x: 260, y: 280))
        //            path.addArc(center: CGPoint(x: 200, y: 200), radius: 100, startAngle: .degrees(53), endAngle: .degrees(330), clockwise: false)
        //            path.addArc(center: CGPoint(x: 114, y: 251), radius: 200, startAngle: .degrees(-30), endAngle: .degrees(9), clockwise: false)
        //            path.move(to: CGPoint(x: 260, y: 280))
        //            path.addArc(center: CGPoint(x: 152, y: 272), radius: 160, startAngle: .degrees(2), endAngle: .degrees(87), clockwise: false)
        //            path.addArc(center: CGPoint(x: 110, y: 290), radius: 150, startAngle: .degrees(70), endAngle: .degrees(-4), clockwise: true)
        //            path.closeSubpath()
        
        // MARK:- Shit tomoe 2
        
        //        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        //        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY), control: CGPoint(x: rect.maxX, y: rect.minY))
        //        path.addQuadCurve(to: CGPoint(x: rect.midX * 0.8, y: rect.maxY), control: CGPoint(x: rect.maxX * 0.95, y: rect.maxY))
        //        path.addQuadCurve(to: CGPoint(x: rect.midX * 1.5, y: rect.midY * 0.95), control: CGPoint(x: rect.maxX * 0.87, y: rect.maxY * 0.87))
        //        path.addQuadCurve(to: CGPoint(x: rect.midX * 1.1, y: rect.midY * 1.2), control: CGPoint(x: rect.midX * 1.4, y: rect.midY * 1.2))
        //        path.addQuadCurve(to: CGPoint(x: rect.midX * 0.55, y: rect.midY * 0.5), control: CGPoint(x: rect.midX * 0.5, y: rect.midY * 1.2))
        //        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.midX * 0.65, y: rect.midY * 0.05))
        
        // MARK:- Real tomoe
        
        path.move(to: isMangekyou ?
                    CGPoint(x: rect.midX * 0.75, y: rect.midY * 1) :
                    CGPoint(x: rect.midX * 1.3, y: rect.midY * 0.6))
        
        path.addQuadCurve(
            to: isMangekyou ?
                CGPoint(x: rect.maxX * 0.99, y: rect.maxY * 0.6) :
                CGPoint(x: rect.midX * 0.5, y: rect.maxY * 1.05),
            control: isMangekyou ?
                CGPoint(x: rect.maxX * 0.7, y: rect.maxY * 0.2) :
                CGPoint(x: rect.maxX * 1, y: rect.midY * 1.35))
        
        path.addQuadCurve(
            to: isMangekyou ?
                CGPoint(x: rect.midX * 1.14, y: rect.midY * 1.2) :
                CGPoint(x: rect.midX * 0.8, y: rect.midY * 0.6),
            control: isMangekyou ?
                CGPoint(x: rect.midX * 1.4, y: rect.midY * 0.8) :
                CGPoint(x: rect.midX * 1.45, y: rect.midY * 1.2))
        return path
    }
}

struct TomoeView: View {
    @Binding var diameter: CGFloat
    @Binding var isMangekyou: Bool
    
    var body: some View {
        let radius: CGFloat = isMangekyou ? diameter : diameter * 0.242
        
        ZStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: diameter * 0.121, height: diameter * 0.121)
//                .opacity(isMangekyou ? 0 : 1)
            Tomoe(isMangekyou: $isMangekyou)
                .foregroundColor(.black)
                .frame(width: radius, height: radius)
//                .rotation3DEffect(.degrees(isMangekyou ? 180 : 0), axis: (x: 0, y: isMangekyou ? 1 : 0, z: 0))
        }
    }
}
