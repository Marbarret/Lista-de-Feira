//
//  ItemModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import Foundation

struct ListsUser: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let month: String
}

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var productName: String
    var brandName: String
    var price: Double
    
    init(id: String = UUID().uuidString, productName: String, brandName: String, price: Double) {
        self.id = id
        self.productName = productName
        self.brandName = brandName
        self.price = price
    }
    
    func updateItem() -> ItemModel {
        return ItemModel(productName: productName, brandName: brandName, price: price)
    }
}

var purchase: [ItemModel] = [
    ItemModel(productName: "Arroz Branco", brandName: "Fazenda", price: 23.4),
    ItemModel(productName: "Feijão", brandName: "Tio João", price: 3),
    ItemModel(productName: "Açucar", brandName: "Fazenda", price: 4.54),
    ItemModel(productName: "Papel Toalha", brandName: "Neve", price: 4.80),
    ItemModel(productName: "Papel Toalha", brandName: "Neve", price: 4.80),
    ItemModel(productName: "Papel Toalha", brandName: "Neve", price: 4.80),
    ItemModel(productName: "Papel Toalha", brandName: "Neve", price: 4.80)
]
