//
//  ItemPurchases.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import SwiftUI

struct ItemPurchases: View {
    var item: ItemModel
    
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 35, height: 35)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.productName)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(item.brandName)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
            }// VStack
            
            Spacer()
            
            Text("\(item.price)")
                .bold()
        }// HStack
        .padding()
        .padding([.top, .bottom], 6)
    }
}

struct ItemPurchases_Previews: PreviewProvider {
    static var previews: some View {
        ItemPurchases(item: ItemModel(productName: "Arroz Branco", brandName: "Fazenda", price: 10))
    }
}
