//
//  UserModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import Foundation

struct UserModel:  Identifiable {
    var givenName,
        email: String?
    var imgUser: URL?
    
    var id: String {
        return "id"
    }
}
