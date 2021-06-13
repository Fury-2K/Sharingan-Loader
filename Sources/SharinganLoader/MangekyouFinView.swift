//
//  MangekyouFinView.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 12/06/21.
//

import SwiftUI

struct MangekyouFin: Shape {
    let screenCenter = UIScreen.main.bounds.midX
    let mainCircleCenter: CGPoint = CGPoint(x: UIScreen.main.bounds.midX - 10, y: UIScreen.main.bounds.midY + 7)
    let a: CGPoint = CGPoint(x: UIScreen.main.bounds.midX - 10, y: UIScreen.main.bounds.midY + 17)
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX * 0.75, y: rect.midY))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX * 1.91, y: rect.maxY * 0.7),
            control: CGPoint(x: rect.maxX * 0.7, y: rect.midY * 1.9))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX * 1.15, y: rect.midY * 0.7),
            control: CGPoint(x: rect.midX * 1.3, y: rect.midY * 1.6))
        return path
    }
}

struct MangekyouFinView: View {
    let radius: CGFloat = 300
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: radius, height: radius)
            
            MangekyouFin()
                .frame(width: radius, height: radius)
                .rotationEffect(.degrees(120))
            MangekyouFin()
                .frame(width: radius, height: radius)
                .rotationEffect(.degrees(240))
            MangekyouFin()
                .frame(width: radius, height: radius)
            
            Circle()
                .foregroundColor(.red)
                .frame(width: 45.3, height: 45.3)
        }
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
}

struct MangekyouFinView_Previews: PreviewProvider {
    static var previews: some View {
        MangekyouFinView()
    }
}
