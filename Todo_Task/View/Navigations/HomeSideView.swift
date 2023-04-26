//
//  HomeSideView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 26.04.2023.
//

import SwiftUI

struct HomeSideView: View {
    @Binding var selectedTab : String
    
    //Hidding tab bar
    init(selectedTab: Binding<String>){
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        //TabView with tabs
        TabView(selection: $selectedTab){
            
            //Views
            HomePage()
                .tag("Home")
            
            CartTabScreen()
                .tag("CartTabScreen")
            
//            Settings()
//                .tag("Settings")
            
        }
    }
}

struct HomeSideView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomePage : View {
    var body: some View{
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20){
                Image("image-1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("Tony Stark")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Tony Stark")
                        .font(.caption)
                        .fontWeight(.semibold)
                })
            }
        }
    }
}










