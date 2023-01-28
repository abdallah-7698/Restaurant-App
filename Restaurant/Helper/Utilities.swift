//
//  Utilities.swift
//  Yummie
//
//  Created by Abdallah on 25/01/2023.
//

import UIKit

protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentifiable {}
