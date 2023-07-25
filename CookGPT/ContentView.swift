//
//  ContentView.swift
//  CookGPT
//
//  Created by israel soto on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldShowOnboarding") var showOnboarding: Bool = true
    var recipe: [RecipeItem]
    var body: some View {
        
        TabView {
            
            VStack {
                HomeView(recipe: recipe)
            }.tabItem{
                Label("Home", systemImage: "house.fill")
            }
            
            VStack {
                CameraView()
            }.tabItem {
                Label("Camera", systemImage: "camera")
            }
            
            VStack {
                ProfileView()
            }.tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $showOnboarding)
        })
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(recipe: RecipeModel().recipe)
        }
    }
    
}

