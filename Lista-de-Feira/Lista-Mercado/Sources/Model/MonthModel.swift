//
//  MonthModel.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import Foundation

struct MonthModel: Identifiable, Decodable, Hashable {
    var id = UUID().uuidString
    let name: String
    let abbreviation: String
//    
    enum CodingKeys: String, CodingKey {
        case id, name, abbreviation
    }
//    
//    init() {
//        self.id = "0"
//        self.name = "Janeiro"
//        self.abbreviation = "JAN"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        id = try container.decode(String.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        abbreviation = try container.decode(String.self, forKey: .abbreviation)
//    }
}
