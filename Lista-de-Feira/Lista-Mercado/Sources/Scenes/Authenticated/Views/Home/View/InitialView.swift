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
                    
                    Spacer(minLength: 80)
                    
                    // MARK: - Add List
                    
                    Button {
                        showNewList = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        
                        Text("New List")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }// Button
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(Color.theme.background)
                    .cornerRadius(10)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                    
                    ExplorerComponent()
//                     MARK: - List
                    List {
                        ForEach(purchase) { item in
                            ItemPurchases(item: item)
                        }
                    }//: List
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
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
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(homeViewModel: .init(authService: AuthService()))
    }
}
