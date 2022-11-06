//
//  ItemListViewModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 04/11/22.
//

import Foundation

class ItemListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    @Published var listUser: [ListsUser] = []
    let key: String = "item_List"
    
    init() {
        getItems()
    }
    
    func createList(title: String, month: String) {
        let newList = ListsUser(title: title, month: month)
        listUser.append(newList)
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func addItem(title: String, brand: String, price: Double) {
        let newItem = ItemModel(productName: title, brandName: brand, price: price)
        items.append(newItem)
    }
    
    func editItemList(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateItem()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
}
