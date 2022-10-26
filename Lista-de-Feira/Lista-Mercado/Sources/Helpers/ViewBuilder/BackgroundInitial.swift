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
                        .setValueCircle(width: 150, height: 150, x: 50, y: 180)
                    
                    Circle()
                        .setValueCircle(width: 200, height: 200, x: -120, y: -55)
                    
                    content
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

