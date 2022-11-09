//
//  TabButton.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var image: String
    var animation: Namespace.ID

    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
        }, label: {
                HStack(spacing: 10) {
                    Image(systemName: image)
                        .font(.title2)
                    
                    Text(title)
                        .fontWeight(.semibold)
                }// HStack
                .foregroundColor(selectedTab == title ? Color.theme.primaryColor : Color.theme.gray)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                //max frame
                .frame(maxWidth: getRect().width - 170, alignment: .leading)
                .background(
                    ZStack {
                        if selectedTab == title {
                            Color.theme.bluePrimary
                                .opacity(selectedTab == title ? 1 : 0)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                .clipShape(Corners(corner: [.topLeft, .bottomLeft], size: CGSize(width: 5, height: 5)))
                        }
                    }
                )// background
               })// Button
    }
}
