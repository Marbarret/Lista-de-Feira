//
//  SplashScreenView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 18/10/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        BackgroundInitial {
            VStack(spacing: 10) {
                Spacer()
                LogoComponent()
                
                ButtonLogin()
                
                Text("Informações de Aplicativo")
                    .font(.system(size: 10))
                    .fontWeight(.light)
                    .foregroundColor(Color.theme.bluePrimary)
                Spacer()
            }
        }
        .overlay(
            ZStack {
                if isActive {
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.title2)
                        .frame(width: 60, height: 60)
                        .background(Color.theme.primaryColor)
                        .cornerRadius(10)
                }
            }
        )
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
