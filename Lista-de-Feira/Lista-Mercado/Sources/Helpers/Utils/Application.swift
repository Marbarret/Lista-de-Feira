//
//  Application.swift
//  Lista-Mercado
//
//  Created by Marcylene Barreto on 20/10/22.
//

import Foundation
import UIKit

final class ApplicationUtility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
