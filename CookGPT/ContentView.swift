//
//  ContentView.swift
//  CookGPT
//
//  Created by israel soto on 7/23/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView {
            
            VStack {
                HomeView()
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
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
