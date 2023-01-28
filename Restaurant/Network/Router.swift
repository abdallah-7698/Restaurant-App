//
//  Router.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import Foundation

enum Route {
    
    static let baseURL = "https://yummie.glitch.me"
    
    case feachAllCategories
    case placeOrder (String)
    case feachCategoryDishes(String)
    case feachOrders
    
    var description : String{
        switch self {
        case .feachAllCategories: return Route.baseURL+"/dish-categories"
        case .placeOrder(let dishId): return Route.baseURL+"/orders/\(dishId)"
        case .feachCategoryDishes(let categoryId): return Route.baseURL+"/dishes/\(categoryId)"
        case .feachOrders: return Route.baseURL+"/orders"
        }
    }
}
