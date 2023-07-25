//
//  RecipeModel.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import Foundation

class RecipeModel {
    
    struct Recipe: Codable{
        var recipe: [RecipeItem]
    }
    
    var recipe:[RecipeItem] = []
    
    init(){
        if let recipeJSON = decodeJSON(data: data){
            recipe = recipeJSON.recipe
        }
    }
    func decodeJSON(data:Data!)-> Recipe! {
        var recipe:Recipe! = nil
        let decoder = JSONDecoder()
        do{
            try recipe = decoder.decode(Recipe.self, from: data)
        } catch let error as NSError{
        print("Error reading JSON file: \(error.localizedDescription)")
        }
        return recipe
    }
}

let data = """
    {"recipe":[
       {
          "id":0,
          "category":"Lunch",
          "name":"Margherita",
          "description":"The classic pizza of Buffalo. Mozzarella, tomatoes, and basil on a Neopolitan crust",
          "rating":4
       },
       {
          "id":1,
          "category":"Dinner",
          "name": "Quattro Formaggi",
          "description": "A blend of Asiago, Parmesan, buffalo mozzarella, and Gorgonzola on a Neopolitan crust",
          "rating":3
       },
       {
          "id":2,
          "category": "Breakfast",
          "name": "Cereal",
          "description": "A bowl of cereal with cold milk, oat milk, or almond milk.",
          "rating":4
       },
       {
          "id":3,
          "category": "Lunch",
          "name": "Tacos",
          "description": "Savory tacos for friends and family.",
          "rating":5
       },
       {
          "id":4,
          "category": "Dinner",
          "name": "Pepperoni Pizza",
          "description": " The New York classic version. A thin crust with pizza sauce, cheese, and pepperoni.",
          "rating":5
       },
    {
          "id":5,
          "category": "Dinner",
          "name": "Chicago Deep Dish",
          "description": "Chicago Deep Dish: The classic deep dish cheese pizza. 2 inches Thick and filled with sauce and cheese. ",
          "rating":4
       },
       {
          "id":6,
          "category": "Dinner",
          "name": "Meat Lovers",
          "description": "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish.",
          "rating":2
       },
       {
          "id":7,
          "category": "Lunch",
          "name": "BBQ Chicken",
          "description": "BBQ Chicken: Grilled chicken with barbecue sauce, red onions, and peppers on a Neopolitan crust",
          "rating":4
       }
    ]
    }
    """.data(using: .utf8)

