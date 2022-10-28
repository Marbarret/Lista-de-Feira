//
//  JSONBundle.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 26/10/22.
//

import Foundation

struct JSON {
    static func loadJSON(bundle: Bundle = Bundle.main, resource: String) -> Data {
        guard let url = bundle.url(forResource: resource, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return Data()
        }
        return data
    }
}
