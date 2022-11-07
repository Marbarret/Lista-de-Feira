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
            
            VStack {
                Text("Hello,")
                    .font(.footnote)
                + Text("\n\(name)")
                    .font(.title3)
            }
            Spacer()
            
            buttonSideMenu

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
    }
    
    private var buttonSideMenu: some View {
        Button {
            print("Clique no Menu")
        } label: {
            Image(systemName: "text.justify")
                .resizable()
                .foregroundColor(Color.theme.gray)
                .frame(width: 22, height: 22)
        }
        .padding()
    }
}
