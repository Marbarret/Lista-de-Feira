//
//  MonthService.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import Foundation

protocol MonthServiceProtocol {
    func loadMonth() -> [MonthModel]
}

class MonthService: MonthServiceProtocol {
    func loadMonth() -> [MonthModel] {
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([MonthModel].self, from: JSON.loadJSON(bundle: Bundle.main, resource: "Months"))
            return jsonData
        } catch {
            print("error: \(error)")
        }
        return []
    }
}
