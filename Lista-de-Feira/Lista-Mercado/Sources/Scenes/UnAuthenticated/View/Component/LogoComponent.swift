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
            Image("logo-my-market")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .padding(.vertical, UIScreen.main.bounds.size.height / 10)            
        }
    }
}

struct LogoComponent_Previews: PreviewProvider {
    static var previews: some View {
        LogoComponent()
    }
}
