//
//  ImageLoad.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 21/10/22.
//

import SwiftUI

struct ImageLoad: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: self.width, height: self.height)
            .scaledToFit()
    }
}
