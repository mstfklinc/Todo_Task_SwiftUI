//
//  SideHome.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct SideHome: View {
    
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
            Home()
                .tag("Home")
            
            History()
                .tag("History")
            
            Notifications()
                .tag("Notifications")
            
//            Settings()
//                .tag("Settings")
            
            Help()
                .tag("Help")
            
        }
    }
}

struct SideHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct History : View {
    var body: some View{
        NavigationView {
            VStack(alignment: .leading, spacing: 20){
                Image("image-2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("History")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("History")
                        .font(.caption)
                        .fontWeight(.semibold)
                })
            }
        }
    }
}


struct Notifications : View {
    var body: some View{
        NavigationView {
            VStack(alignment: .leading, spacing: 20){
                Image("image-3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("Notifications")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Notifications")
                        .font(.caption)
                        .fontWeight(.semibold)
                })
            }
        }
    }
}

struct Help : View {
    var body: some View{
        NavigationView {
            VStack(alignment: .leading, spacing: 20){
                Image("image-2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("Help")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Help")
                        .font(.caption)
                        .fontWeight(.semibold)
                })
            }
        }
    }
}
