//
//  InitialView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import SwiftUI

struct InitialView: View {
    @State private var showNewList: Bool = false
    @ObservedObject var homeViewModel: HomeViewModel
    @StateObject var listVM: ItemListViewModel = ItemListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack(spacing: 10) {
                        ProfileComponent(name: homeViewModel.user?.givenName ?? "", photo: homeViewModel.user?.imgUser)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            
                        }
                        
                    }// HStack
                    .padding()
                    .foregroundColor(.white)
                    
                    // MARK: - Add List
                    HStack {
                        // MARK: - Button Information Value
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            ShapeComponent(titleButton: "R$ 2.999", subTitle: "Gasto do mes", image: "chevron.right")
                        })
                        
                        // MARK: - Button New List
                        
                        Button {
                            showNewList = true
                        } label: {
                            HStack {
                                Text("New List")
                                    .font(.title3)
                                
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.theme.background)
                            }// HStack
                            .foregroundColor(Color.theme.background)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 17)
                            .background(Color.theme.blueSecondary)
                            .clipShape(Corners(corner: [.topRight, .bottomRight], size: CGSize(width: 10, height: 10)))
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                        }// Button
                    }// HStack
                    .padding()
                    .padding(.top, -30)
                    
                    ExplorerComponent(userList: ListsUser(title: "Setembro", month: ""))
                    
                    // MARK: - List
                    VStack(spacing: 2) {
                        ForEach(listVM.listUser) { item in
                            ListComponent(nameList: item.title, date: item.month)
                        }// ForEach
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 5)
                    
                    Spacer()
                    
                }// VStack
                .blur(radius: showNewList ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))
                
                // MARK: - New List
                if showNewList {
                    BlankView()
                        .onTapGesture {
                            withAnimation() {
                                showNewList = false
                            }
                        }
                    CreateNewList()
                }
            }// ZStack
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Task", displayMode: .large)
            .navigationBarHidden(true)
            .background(
                Color.theme.bluePrimary.ignoresSafeArea(.all)
            )
        }// NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .environmentObject(listVM)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(homeViewModel: .init(authService: AuthService()))
    }
}
