//
//  MainView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 08/11/22.
//

import SwiftUI

struct MainView: View {
    // MARK: - State
    @State var selectedTab = "Home"
    @State var showMenu = false
    @ObservedObject var homeViewModel: HomeViewModel
    
    @Namespace var animation
    
    var body: some View {
        ZStack {
            Color.theme.blueSecondary
                .ignoresSafeArea()
//            LinearGradient(gradient: Gradient(colors: [Color.theme.gray, Color.theme.blueSecondary]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            
            //Header
            SideMenu(selectedTab: $selectedTab, name: homeViewModel.user?.givenName ?? "", photo: homeViewModel.user?.imgUser)
            ZStack {
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical, 60)
                
                TabBarView(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }// ZStack
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                }, label: {
                    VStack(spacing: 5) {
                        Capsule()
                            .fill(showMenu ? Color.white : Color.theme.primaryColor)
                            .frame(width: 20, height: 3)
                            .rotationEffect(.init(degrees:  showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 8 : 0)
                        
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(showMenu ? Color.white : Color.theme.primaryColor)
                                .frame(width: 20, height: 2)
                            
                            Capsule()
                                .fill(showMenu ? Color.white : Color.theme.primaryColor)
                                .frame(width: 20, height: 2)
                                .offset(y: showMenu ? -8 : 0)
                        }// VStack
                        .rotationEffect(.init(degrees:  showMenu ? 50 : 0))

                    }// VStack
                    
                })// Button
                .padding()
                
                ,alignment: .topLeading
            )//overlay
        }// ZStack
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(homeViewModel: .init(authService: AuthService()))
    }
}
