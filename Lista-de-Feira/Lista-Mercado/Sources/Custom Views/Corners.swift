//
//  Corners.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import SwiftUI

struct Corners: Shape {
    var corner: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        return Path(path.cgPath)
    }
}

