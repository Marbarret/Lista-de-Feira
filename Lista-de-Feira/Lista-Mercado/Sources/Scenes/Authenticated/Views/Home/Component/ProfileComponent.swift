//
//  ProfileComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI
import Kingfisher

struct ProfileComponent: View {
    var name: String
    var photo: URL?
    
    var body: some View {
        HStack {
            buttonProfileUser
            
//            VStack {
//                Text("Hello,")
//                    .font(.footnote)
//                + Text("\n\(name)")
//                    .font(.title3)
//            }
//            Spacer()
            
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
                .cornerRadius(10)
                .frame(width: 30, height: 30)
        }
        .padding(.trailing, 5)
        
    }
}
