//
//  InitialViewModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 20/10/22.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var statusLogin: StatusLogin = .signedOut
    @Published var cancel: Bool = false
    @Published var errorStatus: ErrorState = .none
    
    var service: AuthServiceProtocol!
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func signIn() {
        statusLogin = .unknown
        service.signIn { result in
            switch result {
            case .success:
                self.statusLogin = .signedIn
            case .failure(let error):
                switch error {
                case .errorAuthentication:
                    self.cancel.toggle()
                    self.statusLogin = .signedOut
                case .errorSignIn:
                    self.statusLogin = .signedOut
                }
            }
        }
    }
    
    func checkConnect() {
        if service.checkSignIn() {
            statusLogin = .unknown
            service.loadSignUser { result in
                switch result {
                case .success:
                    self.statusLogin = .signedIn
                case .failure(_):
                    self.statusLogin = .signedOut
                }
            }
        }

    }
    
    func signOutView() {
        if service.signOut() {
            self.statusLogin = .signedOut
        }
    }
}
