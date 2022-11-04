//
//  OverviewView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI

struct OverviewView: View {

    var body: some View {
        NavigationView {
            List {
                ForEach(purchase) { item in
                    ItemPurchases(item: item)
                }
            }
            .padding(.top, 5)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("List Purchase")
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
