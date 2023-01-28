//
//  DishModel.swift
//  FlatMapProject2
//
//  Created by Abdallah on 27/01/2023.
//

import Foundation

// MARK: - Dish
struct Dishes: Codable {
    let status: Int?
    let message: String?
    let data: [DishModel]?
}

// MARK: - Dish
struct DishModel: Codable {
    let id, name, description: String?
    let image: String?
    let calories: Int?
}

