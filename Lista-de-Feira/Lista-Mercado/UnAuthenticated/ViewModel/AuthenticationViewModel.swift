//
//  InitialViewModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 20/10/22.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
        
    var service: AuthServiceProtocol!
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func signIn() {
        service.signIn()
    }
    
    func checkConnect() {

    }
    
    func signOutView() {
       
    }
}
