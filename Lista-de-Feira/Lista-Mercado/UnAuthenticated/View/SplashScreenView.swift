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
            VStack {
                LogoComponent()
                
                ButtonLogin()
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
                        .background(Color.theme.background)
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
