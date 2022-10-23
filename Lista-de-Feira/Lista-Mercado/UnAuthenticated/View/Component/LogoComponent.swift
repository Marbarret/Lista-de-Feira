//
//  LogoComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct LogoComponent: View {
    var body: some View {
        HStack {
            Image("lista-feira-2")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .padding(.vertical, UIScreen.main.bounds.size.height / 10)
            
            Text("Lista Mercado")
                .font(.title2)
                .bold()
                .foregroundColor(Color.theme.background)
            + Text("\nControle")
                .font(.subheadline)
                .foregroundColor(Color.theme.gray)
            
        }
    }
}

struct LogoComponent_Previews: PreviewProvider {
    static var previews: some View {
        LogoComponent()
    }
}
