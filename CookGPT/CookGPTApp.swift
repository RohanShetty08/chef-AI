//
//  CookGPTApp.swift
//  CookGPT
//
//  Created by israel soto on 7/23/23.
//

import SwiftUI

@main
struct CookGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(recipe: RecipeModel().recipe)
        }
    }
}
