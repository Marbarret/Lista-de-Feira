//
//  View+Extension.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

extension View {
    func setValueCircle(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> some View {
        self.modifier(CircleModifier(width: width, height: height, x: x, y: y))
    }
}
