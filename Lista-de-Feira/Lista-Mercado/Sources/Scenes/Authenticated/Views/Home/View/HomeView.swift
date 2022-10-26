//
//  HomeView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 25/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    init(homeViewModel: HomeViewModel) {
        _homeViewModel = ObservedObject(wrappedValue: homeViewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ProfileComponent(name: homeViewModel.user?.givenName ?? "", photo: homeViewModel.user?.imgUser)
                HStack {
                    ShapeComponent()
                }
                .padding(.top, -70)
                
                ExplorerComponent()
                Spacer()
                
                Text("profile usuario")
            }
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
        }
    }
}
