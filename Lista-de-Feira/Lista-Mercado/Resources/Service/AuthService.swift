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
    func signIn()
}

class AuthService: AuthServiceProtocol {
    
    func signIn() {
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientId)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) { [self] user, error in
            if let error = error {
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (result, err) in
                if let error = err {
                    print(err?.localizedDescription)
                }
                
                guard let user = result?.user else {
                    return
                }
                print(user.displayName ?? "Success!")
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
    
//    func getUser() -> UserModel? {
//        guard let user = GIDSignIn.sharedInstance.currentUser else {return nil}
//        return UserModel(givenName: user.profile?.givenName, email: user.profile?.email, imgUser: user.profile?.imageURL(withDimension: 200))
//    }
    
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
//            completion(.failure(Error.authentication))
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
