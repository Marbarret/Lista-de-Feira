//
//  TabBarView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            InitialView(homeViewModel: .init(authService: AuthService()))
                .tag("Home")
            
//            OverviewView()
//                .tag("Carteira")
            ProfileView()
                .tag("Profile")
        }
    }
}

