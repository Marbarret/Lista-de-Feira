//
//  AuthService.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 20/10/22.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn

protocol AuthServiceProtocol {
    func signIn(completion: @escaping (Result<Bool, ErrorApp>) -> Void)
    func signOut() -> Bool
    func checkSignIn() -> Bool
    func loadSignUser(completion: @escaping (Result<Bool, Error>) -> Void)
    func getUser() -> UserModel?
}

class AuthService: AuthServiceProtocol {
    
    func signIn(completion: @escaping (Result<Bool, ErrorApp>) -> Void) {
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientId)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) { [self] user, error in
            if error != nil {
                return
            } else if let GIDuser = user {
                self.authenticateUser(for: GIDuser) { result in
                    switch result {
                    case .success:
                        completion(.success(true))
                    case .failure:
                        completion(.failure(ErrorApp.errorAuthentication))
                    }
                }
            }
        }
    }
    
    func checkSignIn() -> Bool {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            return true
        } else {
            return false
        }
    }
    
    func loadSignUser(completion: @escaping (Result<Bool, Error>) -> Void) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, err in
            self.authenticateUser(for: user) { result in
                switch result {
                case .success:
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getUser() -> UserModel? {
        guard let user = GIDSignIn.sharedInstance.currentUser else {return nil}
        return UserModel(givenName: user.profile?.givenName, email: user.profile?.email, imgUser: user.profile?.imageURL(withDimension: 200))
    }
    
    func signOut() -> Bool {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, completion: @escaping (Result<User, Error>) -> Void) {
        guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
        else {
            completion(.failure(ErrorApp.errorAuthentication))
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, err) in
            if let error = err {
                completion(.failure(error))
            } else if let userData = result?.user {
                completion(.success(userData))
            }
        }
    }
}
