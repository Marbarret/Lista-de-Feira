//
//  HomeViewModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    var authService: AuthServiceProtocol!
    
    @Published var user: UserModel?
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
        self.getUserProfile()
    }
    
    func getUserProfile() {
        user = authService.getUser()
    }
}
