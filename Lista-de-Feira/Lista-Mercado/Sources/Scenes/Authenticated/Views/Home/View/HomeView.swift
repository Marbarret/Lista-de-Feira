//
//  HomeView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var showNewList: Bool = false
    
    init(homeViewModel: HomeViewModel) {
        _homeViewModel = ObservedObject(wrappedValue: homeViewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // MARK: - Profile User
                    ProfileComponent(name: homeViewModel.user?.givenName ?? "", photo: homeViewModel.user?.imgUser)
                    
                    // MARK: - Shape Value
                    HStack {
                        ShapeComponent()
                    }// HStack
                    .padding(.top, -70)
                    
                    // MARK: - Shape Date
                    ExplorerComponent()
                    
                    // MARK: - Buttons
                    //                ScrollView(.vertical, showsIndicators: false) {
                    HStack(spacing: 15) {
                       

                    }// HStack
                    .padding(.vertical, 25)
                    //                }// ScrollView
                    .padding(.top, -60)
                    
                    if showNewList {
                        BlankView()
                            .onTapGesture {
                                withAnimation() {
                                    showNewList = false
                                }
                            }
                        CreateNewList()
                    }
                    
                }// VStack
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
            }// ZStack
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
        }// NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
