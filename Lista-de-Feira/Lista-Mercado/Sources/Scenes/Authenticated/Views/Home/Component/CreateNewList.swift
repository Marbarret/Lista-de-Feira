//
//  CreateNewList.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import SwiftUI

struct CreateNewList: View {
    @State var textFieldName: String = ""
    @State private var month = Date()
    
    @EnvironmentObject var listViewModel: ItemListViewModel
    @Environment(\.presentationMode) var presentationMode
    
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
                
                VStack {
                    DatePicker(selection: $month, displayedComponents: [.date]) {
                        Text("Select a Date")
                            .font(.footnote)
                            .fontWeight(.thin)
                    }
                }
                
                Button(action: { saveItem() }, label: {
                    Text("Save".uppercased())
                        .disabled(isButtonDisabled)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isButtonDisabled ? Color.theme.blueSecondary : Color.theme.background)
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
    
    func saveItem() {
        listViewModel.createList(title: textFieldName, month: "\(month)")
        presentationMode.wrappedValue.dismiss()
        print("Lista Salva")
    }
}

struct CreateNewList_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewList()
    }
}
