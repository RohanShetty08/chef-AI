//
//  RecipeRowView.swift
//  CookGPT
//
//  Created by israel soto on 7/25/23.
//

import SwiftUI

struct RecipeRowView: View {
    var item: RecipeItem
    //var rating: Int
    
    var body: some View {
        HStack(alignment: .top, spacing:15) {
            if let image = UIImage(named: "\(item.id)_sm") {
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading, -15)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    
                }
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: (star <= item.rating) ? "star.fill": "star").foregroundColor(.yellow)
                    }
                }
                Text("Rating: " + String(item.rating))
                //RatingsView(rating: item.rating)
                
            }
        }
        
    }
}

struct RecipeItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(item: testRecipeItem)
    }

    
}
