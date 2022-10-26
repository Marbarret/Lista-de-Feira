//
//  ButtonLogin.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct ButtonLogin: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Button {
                authViewModel.signIn()
            } label: {
                HStack(spacing: 15) {
                    Image("logoGoogle")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 90, height: 60)
                .background(Color.theme.background)
                .cornerRadius(20)
            }
            .padding()
            .clipShape(Capsule())
            .padding(.top, 60)
        }
    }
}

struct ButtonLogin_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLogin()
    }
}
