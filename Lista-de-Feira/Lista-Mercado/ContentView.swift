//
//  ContentView.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("color-1")
                .ignoresSafeArea()
            
            Text("Initial Screen")
                .foregroundColor(.white)
                .font(.system(size: 30))
            
        }//Zstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
