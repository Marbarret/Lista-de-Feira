//
//  ShapeComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import SwiftUI

struct ShapeComponent: View {
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .font(.title)
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Gastos mês atual")
                            .font(.caption)
                            .fontWeight(.light)
                        
                        Text("R$ 2.999")
                            .font(.title)
                            .fontWeight(.bold)
                    }// VStack
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.body)
                    
                }// HStack
                .padding()
            }// VStack
            .padding(.all, 20)
            .frame(width: 350, height: 100)
            .background(Color.theme.background)
            .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight, .bottomLeft], size: CGSize(width: 10, height: 10)))
            
            Spacer()
        }// HStack
        .padding()
    }
}

struct ShapeComponent_Previews: PreviewProvider {
    static var previews: some View {
        ShapeComponent()
    }
}
