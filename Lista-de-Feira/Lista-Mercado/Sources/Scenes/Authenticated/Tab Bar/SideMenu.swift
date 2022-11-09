//
//  SideMenu.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 06/11/22.
//

import SwiftUI
import Kingfisher

struct SideMenu: View {
    @Binding var selectedTab: String
    
    @Namespace var animation
    
    var name: String
    let photo: URL?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            KFImage(photo)
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Death")
                    .font(.system(size: 14))
                    .padding(.bottom, 24)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                TabButton(title: "Home", image: "house", animation: animation, selectedTab: $selectedTab)
                
                TabButton(title: "Profile", image: "person", animation: animation, selectedTab: $selectedTab)
                
                TabButton(title: "Notification", image: "bell", animation: animation, selectedTab: $selectedTab)
                
                TabButton(title: "List", image: "list.bullet", animation: animation, selectedTab: $selectedTab)
                
            }// VStack
            .padding(.leading, -20)
            .padding(.top, -10)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 0) {
                TabButton(title: "Logout", image: "power", animation: animation, selectedTab: .constant(""))
                    .padding(.leading, -20)
            }// VStack
            
        }// VStack
        .foregroundColor(Color.theme.gray)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(selectedTab: .constant(""), name: "", photo: URL(string: ""))
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
