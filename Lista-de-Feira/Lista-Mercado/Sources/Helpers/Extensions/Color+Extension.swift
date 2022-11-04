//
//  Color+Extension.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let xcodeColors = XcodeColors()
}

struct ColorTheme {
    let background = Color("background")
    let bluePrimary = Color("color-1")
    let blueSecondary = Color("color-2")
    let gray = Color("color-gray")
}

struct XcodeColors {
    let background = Color("bg-class")
    let lineNumber = Color("lineNumber")
    let text = Color("text")
    let structWord = Color("structWord")
    let typeWord = Color("typeWord")
    let brace = Color("brace")
    let literalString = Color("literalString")
    let number = Color("number")
    let comment = Color("comment")
}
