//
//  OnboardingView.swift
//  CookGPT
//
//  Created by israel soto on 7/25/23.
//

import Foundation
import SwiftUI



// ===== Oboarding
struct OnboardingView : View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View{
        TabView {
            PageView(
                title: "Snap & Scan & Cook",
                subTitle: "Capture Ingredients With Your Camera and Discover Delightful Recipes",
                imageName: "Onboarding_1",
                showDismissButton: false,
                shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(
                title: "Instant Recipes",
                subTitle: "Let your Camera Work Wonders, Get Personalized Recipes Instantly.",
                imageName: "Onboarding_2",
                showDismissButton: false,
                shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(
                title: "Picture Perfect Meals",
                subTitle: "Turn Food Pic Into Scrumptious Recipes. Experience the Magic Now!",
                imageName: "Onboarding_3",
                showDismissButton: true,
                shouldShowOnboarding: $shouldShowOnboarding
            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let subTitle: String
    let imageName: String
    let showDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool

    var body: some View{
        
        VStack(spacing: 16){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 360,height: 360)
            Text(title)
                .font(Font.custom("Mulish", size: 31).weight(.bold))
                .tracking(0.15)
                .lineSpacing(43.40)
                .foregroundColor(Color(red: 0.21, green: 0.13, blue: 0.13))
            Text(subTitle)
                .font(Font.custom("Mulish", size: 16))
                .tracking(0.08)
                .lineSpacing(25.60)
                .foregroundColor(Color(red: 0.65, green: 0.59, blue: 0.59))
            if showDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                },label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.pink)
                        .cornerRadius(25)
                })
            }
        }
    }
}
