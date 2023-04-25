//
//  SideMenu.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab : String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            Image("stark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text("Tony Stark")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: { }, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
                
            })
            
            //Tab buttons
            VStack(alignment: .leading, spacing: 10){
                
                TabButon(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButon(image: "clock.arrow.circlepath", title: "History", selectedTab: $selectedTab, animation: animation)
                
                TabButon(image: "bell.badge", title: "Notifications", selectedTab: $selectedTab, animation: animation)
                
                TabButon(image: "gearshape.fill", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButon(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
                
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            //sign out button
           
            VStack(alignment: .leading, spacing: 6, content: {
                TabButon(image: "rectangle.righthalf.inset.filled.arrow.right", title: "Log Out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
                
                Text("App Version 1.2.34")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            })
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
