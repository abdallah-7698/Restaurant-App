//
//  layout+Extension.swift
//  Yummie
//
//  Created by MacOS on 05/08/2022.
//

import UIKit

extension NSCollectionLayoutItem{
    
    static func withIntireSize()->NSCollectionLayoutItem{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        return NSCollectionLayoutItem.init(layoutSize: itemSize)
    }
    
    static func withIntireWidth(withHeight : NSCollectionLayoutDimension)->NSCollectionLayoutItem{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: withHeight)
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
}

