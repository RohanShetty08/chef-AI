//
//  RecipeItem.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import Foundation

struct RecipeItem: Codable, Hashable, Identifiable {
    var id: Int
    var category: RecipeCategory
    var name:String
    var description:String
    var rating:Int

    /// Custom hash method necessary for navigation paths to use `Hashable` protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    /// Custom equals method necessary for navigation paths to use `Equatable` protocol
    static func ==(lhs:RecipeItem, rhs:RecipeItem)->Bool{
        lhs.id == rhs.id &&
        lhs.category == rhs.category &&
        lhs.description == rhs.description &&
        lhs.name == rhs.name &&
        lhs.rating == rhs.rating
        
    }
}

/// The categories of pizzas used
enum RecipeCategory: String, Codable, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
}

/// A test RecipeItem for previews while composing views
let testRecipeItem = RecipeItem(id: 0, category: .breakfast, name: "Eggs Benedict", description: "Breakfast of champions!!!", rating: 5)
