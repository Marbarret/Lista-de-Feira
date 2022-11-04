//
//  ExplorerComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import SwiftUI

struct ExplorerComponent: View {
    var months = ["JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"]
        
    @State var index = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Mês desejado")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .font(.title)
                    })
                    
                } // HStack
                .foregroundColor(Color.white)
                .padding(.leading, 35)
                .padding(.top, 35)
                .padding(.trailing)
                
                // MARK: - Scrollview com meses
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        mesesTesteVisual1
                    }
                }// ScrollView
                .padding(.top, 25)
                
                Spacer()
                
            }// VStack
            .background(Color.theme.bluePrimary)
        }// ZStack
    }
}

struct ExplorerComponent_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerComponent()
    }
}

extension ExplorerComponent {
    private var mesesTesteVisual1: some View {
        HStack(spacing: 25) {
            ForEach(months, id: \.self) { mes in
                let destinationView = OverviewView()
                NavigationLink(destination: destinationView) {
                    Text(mes)
                        .foregroundColor(self.index == 0 ? .white : .black)
                }// NavigationLink
            }// ForEach
            .padding(.horizontal, 5)
            .padding(.vertical, 30)
            .background(self.index == 0 ? Color.theme.background : Color.theme.background.opacity(0.06))
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 0
            }
        }// HStack
        .padding(.horizontal, 15)
    }
}


