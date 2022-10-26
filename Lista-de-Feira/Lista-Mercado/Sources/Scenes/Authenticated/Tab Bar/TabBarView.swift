//
//  TabBarView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct TabBarView: View {
    @State var current = "Home"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $current) {
                HomeView(homeViewModel: .init(authService: AuthService()))
                    .tag("Home")
                
                OverviewView()
                    .tag("Carteira")
                
                ProfileView()
                    .tag("Perfil")
            }
            
            HStack(spacing: 0) {
                TabButton(title: "Home", image: "house", selected: $current)
                
                TabButton(title: "Carteira", image: "wallet.pass", selected: $current)
                
                TabButton(title: "Perfil", image: "person.fill", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.theme.bluePrimary)
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
    }
}

