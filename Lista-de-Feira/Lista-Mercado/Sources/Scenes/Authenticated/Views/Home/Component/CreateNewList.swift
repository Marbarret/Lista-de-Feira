//
//  CreateNewList.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import SwiftUI

struct CreateNewList: View {
    @State var textFieldName: String = ""
    
    private var isButtonDisabled: Bool {
        textFieldName.isEmpty
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                TextField("Type something here", text: $textFieldName)
                    .foregroundColor(Color.theme.background)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .padding()
                    .frame(height: 55)
                    .background(Color.theme.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Save".uppercased())
                        .disabled(isButtonDisabled)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isButtonDisabled ? Color.theme.gray : Color.theme.background)
                        .cornerRadius(10)
                })
            }// VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
        }// VStack
        .padding()
    }
}

struct CreateNewList_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewList()
    }
}
