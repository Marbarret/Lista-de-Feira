//
//  SideMenu.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 06/11/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Image("logo-my-market-simple")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                
                    Text("My Market")
                        .font(.title2)
                        .fontWeight(.bold)
                
                // calendar
            } // VStack
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 45) {
                        TabButton(title: "Perfil", image: "person")
                        
                        TabButton(title: "Gastos", image: "creditcard.circle")
                        
                        TabButton(title: "Listas", image: "note.text")
                        
                        TabButton(title: "Sair", image: "power")
                        
                    }// VStack
                    .padding()
                    .padding(.leading)
                    .padding(.top, 35)
                }// VStack
                
            }// ScrollView
            
        }// VStack
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.theme.blueSecondary
                .opacity(0.4)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
            
            Text(title)
        })
        .foregroundColor(Color.theme.bluePrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: .constant(true))
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
