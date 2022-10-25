//
//  Lista_MercadoApp.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 18/10/22.
//

import SwiftUI

@main
struct Lista_MercadoApp: App {
   
    private var authService: AuthServiceProtocol
    private var initialViewModel: AuthenticationViewModel
    
    init() {
        self.authService = AuthService()
        self.initialViewModel = AuthenticationViewModel(service: authService)
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(initialViewModel)
                .onAppear {
                    initialViewModel.checkConnect()
                }
        }
    }
}
