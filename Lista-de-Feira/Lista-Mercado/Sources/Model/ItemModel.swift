//
//  ItemModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 03/11/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let productName: String
    let brandName: String
    let price: Double
}

var purchase: [ItemModel] = [
    ItemModel(productName: "Arroz Branco", brandName: "Fazenda", price: 23.4),
    ItemModel(productName: "Feijão", brandName: "Tio João", price: 3),
    ItemModel(productName: "Açucar", brandName: "Fazenda", price: 4.54),
    ItemModel(productName: "Papel Toalha", brandName: "Neve", price: 4.80)
]
