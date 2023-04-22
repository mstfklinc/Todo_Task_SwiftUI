//
//  CreditsView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI

struct CreditsView: View {
    var appURL = URL(string: "https://twitter.com/mstfklinc")!
    var body: some View {
        
        NavigationView{
            ScrollView{
                Text("The first version of the settings screen was inspired by my close friend's app. \n\nI included it in my app Gradient Game with his permission. \n\nYou can download his lovely app from the link below.")
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .settingsBackground()
                
                SettingsRow(imageName: "eyedropper.halffull", title: "Neon by Swapnanil Dhol"){
                    UIApplication.shared.open(self.appURL)
                }
                .padding()
                .settingsBackground()
                    
            }
            .navigationBarTitle("Credits")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
