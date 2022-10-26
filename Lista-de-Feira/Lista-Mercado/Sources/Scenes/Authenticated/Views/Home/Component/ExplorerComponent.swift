//
//  ExplorerComponent.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import SwiftUI

struct ExplorerComponent: View {
    
    @State var index = 0
    
    var body: some View {
        ZStack {
            Color(.cyan)
            
            VStack {
                HStack {
                    Text("Mês desejado")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "ellipsis")
                            .font(.title)
                    })
                    
                } // HStack
                .foregroundColor(Color.theme.bluePrimary)
                .padding(.leading, 35)
                .padding(.top, 35)
                .padding(.trailing)
                
                // MARK: - Scrollview com meses

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        VStack(spacing: 12) {
                            Image(systemName: "calendar")
                                .font(.title)
                                .foregroundColor(Color.theme.bluePrimary)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            
                            Text("Mês")
                                .foregroundColor(self.index == 0 ? .white : .black)
                        }// VStack
                        .padding(.horizontal, 5)
                        .padding(.vertical, 30)
                        .background(self.index == 0 ? Color.theme.background : Color.theme.background.opacity(0.06))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index = 0
                        }
                    }// HStack
                    .padding(.horizontal, 25)
                }// ScrollView
                .padding(.top, 25)
                
                Spacer()
                
            }// VStack
            .background(Color.white)
//            .clipShape(Corners(corner: [.topLeft], size: CGSize(width: 70, height: 70)))
        }// ZStack
    }
}

struct ExplorerComponent_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerComponent()
    }
}
