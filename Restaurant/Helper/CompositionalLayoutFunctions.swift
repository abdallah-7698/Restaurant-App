//
//  CompositionalLayoutFunctions.swift
//  FlatMapProject2
//
//  Created by Abdallah on 28/01/2023.
//

import Foundation

import UIKit

func compositionalLayout()->UICollectionViewCompositionalLayout{
    let layout = UICollectionViewCompositionalLayout { index, environment in
        return createSectionFor(index: index, environment: environment)
    }
    return layout
}

func createSectionFor(index : Int , environment : NSCollectionLayoutEnvironment)->NSCollectionLayoutSection {
    switch index{
    case 0:
        return createFirstSection()
    case 1:
        return createThirdSection()
    default:
        return createFirstSection()
    }
}

func createFirstSection()->NSCollectionLayoutSection{
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100),
                                          heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(10), top: .none, trailing: .none, bottom: .none)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100),
                                           heightDimension: .fractionalHeight(0.06))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
    section.boundarySupplementaryItems = [header]
    
    return section
}

func createThirdSection()->NSCollectionLayoutSection{
    
    let item = NSCollectionLayoutItem.withIntireSize()
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.13))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .padding(topBottom: 5, leftRight: 20)
    
    let section = NSCollectionLayoutSection(group: group)
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
    section.boundarySupplementaryItems = [header]
    
    return section
}
