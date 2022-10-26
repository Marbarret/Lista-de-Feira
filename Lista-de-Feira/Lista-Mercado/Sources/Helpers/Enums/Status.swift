//
//  Status.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

enum StatusLogin {
    case signedIn
    case signedOut
    case unknown
}

enum ErrorState {
    case authError
    case none
}

enum ErrorApp: LocalizedError {
    case errorSignIn
    case errorAuthentication
}
