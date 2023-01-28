//
//  AllDishes.swift
//  Yummie
//
//  Created by MacOS on 25/08/2022.
//

import Foundation

// MARK: - AllDishes
struct AllDishes: Codable {
    let status: Int?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let categories: [CategoryModel]?
    let populars, specials: [DishModel]?
}






