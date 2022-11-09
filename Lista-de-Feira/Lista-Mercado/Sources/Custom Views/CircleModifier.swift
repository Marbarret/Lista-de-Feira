//
//  CircleModifier.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct CircleModifier: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    var x: CGFloat
    var y: CGFloat
    
    init(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) {
        self.width = width
        self.height = height
        self.x = x
        self.y = y
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: self.width, height: self.height)
            .offset(x: self.x , y: self.y)
            .blur(radius: 8)
            .foregroundColor(Color.theme.primaryColor.opacity(0.5))
    }
}
