//
//  ListItemsView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 04/11/22.
//

import SwiftUI

struct ListItemsView: View {
    var body: some View {
        List {
            ScrollView {
                ItemPurchases(item: ItemModel(productName: "Papel higienico", brandName: "Neve", price: 23))
            }
            .frame(width: .infinity)
            .padding()
            .background(Color.theme.bluePrimary)
        }
        .background(Color.white)
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView()
    }
}
