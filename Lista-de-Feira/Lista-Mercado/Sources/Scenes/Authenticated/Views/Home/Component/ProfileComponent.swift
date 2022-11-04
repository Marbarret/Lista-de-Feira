//
//  ProfileComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI
import Kingfisher

struct ProfileComponent: View {
    let name: String
    let photo: URL?
    
    var body: some View {
        HStack {
            buttonProfileUser
            
            Text("Hello,")
                .font(.footnote)
            + Text("\n\(name)")
                .font(.title3)

        }//HStack
    }
}

extension ProfileComponent {
    private var buttonProfileUser: some View {
        Button {
            print("Clique no Perfil")
        } label: {
            KFImage(photo)
                .resizable()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
        }
        .padding()
        .shadow(color: Color.theme.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
