//
//  ContentView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import SwiftUI
import CoreData

struct Home: View {
    var body: some View {

            TabView{
                
                TodoTabScreen()
                    .tabItem{
                        Image(systemName: "list.dash")
                    }
                ChartTabScreen()
                    .tabItem{
                        Image(systemName: "chart.bar.xaxis")
                    }
                
                SettingsScreen()
                    .tabItem{
                        Image(systemName: "gear")
                    }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}