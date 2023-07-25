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
        //        NavigationSplitView{
//            List(recipe, selection: $selectedItem){ item in
//                NavigationLink(value: item){
//                    Text("Description: " + item.description)
//                }
//            }
//        } detail: {
//            //HomeView(recipe: RecipeModel().recipe)
//        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipe: RecipeModel().recipe)
    }
}
