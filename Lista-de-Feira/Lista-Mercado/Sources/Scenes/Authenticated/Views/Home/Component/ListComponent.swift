//
//  ListComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 05/11/22.
//

import SwiftUI

struct ListComponent: View {
    
    var nameList: String
    var date: String
    
    var body: some View {
            HStack(spacing: 30) {
                Text(nameList)
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(Color.theme.background)
                
                Text(date)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.theme.gray)
                
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.body)
                        .foregroundColor(Color.theme.gray)
                }
            }// HStack
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.theme.blueSecondary)
            .padding([.leading, .trailing], 10)
            
    }
}

struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(nameList: "Lista Setembro", date: "23/02/2022")
    }
}
