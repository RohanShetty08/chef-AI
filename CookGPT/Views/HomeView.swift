//
//  HomeView.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import SwiftUI

struct HomeView: View {
    var recipe: [RecipeItem]

    var body: some View {
        
        ZStack() {
            HStack(spacing: 90) {
            Text("Home")
              .font(Font.custom("Mulish", size: 31).weight(.bold))
              .tracking(0.15)
              .lineSpacing(43.40)
              .foregroundColor(Color(red: 0.21, green: 0.13, blue: 0.13))
//            HStack(alignment: .top, spacing: 16) {
//              ZStack() {
//                  Label("Camera", systemImage: "camera")
//              }
//              .frame(width: 24, height: 24)
//            }
          }
          .padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 249))
          .frame(width: 360)
          .offset(x: 0, y: -348.50)
          
          // ===== Recipes list
          VStack(alignment: .leading, spacing: 16) {
                RecipesListView(recipe: recipe)
          }
          .offset(x: 0, y: 45)
          .padding(.top, 200)

          // ===== Categories
          VStack(alignment: .leading, spacing: 20) {
            Text("Your Recent Recipes ")
              .font(Font.custom("Mulish", size: 24).weight(.bold))
              .tracking(0.12)
              .lineSpacing(28.80)
              .foregroundColor(Color(red: 0.21, green: 0.13, blue: 0.13))
            HStack(alignment: .top, spacing: 16) {
              HStack(alignment: .top, spacing: 10) {
                Text("Breakfast")
                  .font(Font.custom("Mulish", size: 13).weight(.semibold))
                  .tracking(0.11)
                  .lineSpacing(16.80)
                  .foregroundColor(.white)
              }
              .padding(14)
              .background(Color(red: 0.91, green: 0.30, blue: 0.38))
              .cornerRadius(8)
              HStack(alignment: .top, spacing: 10) {
                Text("Lunch")
                  .font(Font.custom("Mulish", size: 13))
                  .tracking(0.11)
                  .lineSpacing(16.80)
                  .foregroundColor(Color(red: 0.65, green: 0.59, blue: 0.59))
              }
              .padding(14)
              .cornerRadius(8)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .inset(by: 0.65)
                  .stroke(Color(red: 0.65, green: 0.59, blue: 0.59), lineWidth: 0.65)
              )
              HStack(alignment: .top, spacing: 10) {
                Text("Dinner")
                  .font(Font.custom("Mulish", size: 13))
                  .tracking(0.11)
                  .lineSpacing(16.80)
                  .foregroundColor(Color(red: 0.65, green: 0.59, blue: 0.59))
              }
              .padding(14)
              .cornerRadius(8)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .inset(by: 0.65)
                  .stroke(Color(red: 0.65, green: 0.59, blue: 0.59), lineWidth: 0.65)
              )
              HStack(alignment: .top, spacing: 10) {
                Text("Snacks")
                  .font(Font.custom("Mulish", size: 13))
                  .tracking(0.11)
                  .lineSpacing(16.80)
                  .foregroundColor(Color(red: 0.65, green: 0.59, blue: 0.59))
              }
              .padding(14)
              .cornerRadius(8)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .inset(by: 0.65)
                  .stroke(Color(red: 0.65, green: 0.59, blue: 0.59), lineWidth: 0.65)
              )
            }
          }
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
          .frame(height: 94)
          .offset(x: 0, y: -250)
        }
        .frame(width: 360, height: 800)
        .background(.white);
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(recipe: RecipeModel().recipe)
    }
}
