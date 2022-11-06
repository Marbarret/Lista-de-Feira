//
//  OverviewView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI

struct OverviewView: View {
    let listUser: ListsUser
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(listUser.title)
                        .font(.title)
                    
                    Text(listUser.month)
                        .font(.footnote)
                        .fontWeight(.light)
                }
                
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
        OverviewView(listUser: ListsUser(title: "Setembro", month: "12/09/2022"))
    }
}
