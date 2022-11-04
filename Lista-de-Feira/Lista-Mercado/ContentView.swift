//
//  ContentView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        switch authViewModel.statusLogin {
        case .signedIn: InitialView(homeViewModel: .init(authService: AuthService()))
        case .signedOut: SplashScreenView()
        case .unknown: ProgressView()
        }
    }
}
