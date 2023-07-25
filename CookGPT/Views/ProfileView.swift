//
//  ProfileView.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(spacing: 20){
            Text("Profile")
                .font(Font.custom("Mulish", size: 24).weight(.bold))
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 120)
            Text("Name")
                .font(Font.custom("Mulish", size: 24).weight(.bold))
            HStack(alignment: .top, spacing: 10) {
              Text("tester@gmail.com")
                  .font(Font.custom("Mulish", size: 14))
                  .lineSpacing(16.80)
                  .foregroundColor(Color(red: 0.65, green: 0.59, blue: 0.59))
            }
            Button(action:{
                print("Test")
            }){
                HStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .foregroundColor(Color.black)
                .bold()
                .frame(width: 320, height: 100, alignment: .center)
                .background(Color(red: 0.98, green: 0.97, blue: 0.97))
            }



            Spacer()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
