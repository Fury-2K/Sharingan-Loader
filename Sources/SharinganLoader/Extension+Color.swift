//
//  Extension+Color.swift
//  ShariganLoader
//
//  Created by Manas Aggarwal on 28/05/21.
//

import SwiftUI

extension Color {
    static let shariRed = Color(hex: 0xdb313b)
    static let black = Color(hex: 0x000000)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
