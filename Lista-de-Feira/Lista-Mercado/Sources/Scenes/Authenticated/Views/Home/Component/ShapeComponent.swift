//
//  ShapeComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import SwiftUI

struct ShapeComponent: View {
    
    var titleButton: String
    var subTitle: String
    var image: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subTitle)
                    .font(.caption)
                    .fontWeight(.light)
                
                Text(titleButton)
                    .font(.title3)
                    .fontWeight(.bold)
            }// VStack
            .foregroundColor(.white)
            .padding(.leading, 5)
            
            Spacer()
            Image(systemName: image)
                .font(.body)
                .foregroundColor(Color.white)
        }// HStack
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(Color.theme.primaryColor)
        .clipShape(Corners(corner: [.topLeft, .bottomLeft], size: CGSize(width: 10, height: 10)))
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
    }
}

struct ShapeComponent_Previews: PreviewProvider {
    static var previews: some View {
        ShapeComponent(titleButton: "R$ 2.999", subTitle: "Gasto do mes", image: "")
    }
}
