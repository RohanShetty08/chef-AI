//
//  RecipesListView.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import SwiftUI

struct RecipesListView: View {
    var recipe:[RecipeItem]
    @State private var selectedItem: RecipeItem? = nil
    
    var body: some View {
        List(RecipeCategory.allCases, id:\.self) { category in
            
            Section {
                ForEach(recipe.filter({$0.category == category})){ item in
                    RecipeRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipe: RecipeModel().recipe)
    }
}
