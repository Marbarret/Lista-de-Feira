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
        VStack {
            VStack {
                Image("lista-feira-2")
                    .resizable()
                    .frame(width: 200, height: 120 ,alignment: .center)
            }
            .padding()
            
            VStack {
                Button(action: {
                    authViewModel.signIn()
                }, label: {
                    HStack(spacing: 15) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        
                        Text("Login User")
                            .font(.title3)
                            .fontWeight(.medium)
                            .kerning(1.1)
                    }
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                    Capsule()
                        .strokeBorder(Color.blue)
                    )
            })
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
                        .background(Color.white)
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
