//
//  NSDirectionalEdgeInsets+Extension.swift
//  Yummie
//
//  Created by MacOS on 05/08/2022.
//

import UIKit

extension NSDirectionalEdgeInsets{
    
    static func padding(topBottom : CGFloat , leftRight : CGFloat)->NSDirectionalEdgeInsets{
        return NSDirectionalEdgeInsets(top: topBottom, leading: leftRight, bottom: topBottom, trailing: leftRight)
    }
    
    static func padding(allSides : CGFloat)->NSDirectionalEdgeInsets{
        return NSDirectionalEdgeInsets(top: allSides, leading: allSides, bottom: allSides, trailing: allSides)
    }
    
    
}
