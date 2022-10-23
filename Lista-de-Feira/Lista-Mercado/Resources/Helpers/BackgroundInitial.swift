//
//  BackgroundInitial.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 23/10/22.
//

import SwiftUI

    struct BackgroundInitial<Content: View>: View {
        let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        var body: some View {
            ZStack {
                ZStack {
                    Circle()
                        .setValueCircle(width: 200, height: 200, x: 150, y: 350)
                    
                    Circle()
                        .setValueCircle(width: 300, height: 300, x: -150, y: -200)
                    
                    content
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

