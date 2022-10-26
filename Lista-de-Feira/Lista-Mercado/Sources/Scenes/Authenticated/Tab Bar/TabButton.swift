//
//  TabButton.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var image: String
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(Color.theme.background)
                    .frame(width: 20, height: 20)
                
                if selected == title {
                    Text(title)
                        .fontWeight(.light)
                        .foregroundColor(Color.theme.background).foregroundColor(.white)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.white.opacity(selected == title ? 0.08: 0))
            .clipShape(Capsule())
        }
    }
}
