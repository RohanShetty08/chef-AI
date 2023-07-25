//
//  SplashView.swift
//  CookGPT
//
//  Created by israel soto on 7/25/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false

    var body: some View {
        
        VStack {
            if self.isActive {
                ContentView(recipe: RecipeModel().recipe)
            } else{
                
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 196,height: 196)
                Text("SnapCook")
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
