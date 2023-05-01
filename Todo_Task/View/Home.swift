//
//  ContentView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import SwiftUI
import CoreData
import RiveRuntime

struct Home: View {
//
//    @AppStorage("selectedTab") var selectedTab: Tab = .chat
//    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
//
//    @State var isOpen = false
//    @State var show = false
    
    var body: some View {
        
        
        
        ZStack{
            TabView{
                TodoTabScreen()
                    .tabItem{
                        Image(systemName: "list.dash")
                    }
                CartTabScreen()
                    .tabItem{
                        Image(systemName: "chart.bar.xaxis")
                    }

//                SettingsView()
                SettingsFormView()
                    .tabItem{
                        Image(systemName: "gear")
                    }
            }
        }
        
//        ZStack{
//            Group {
//                switch selectedTab {
//                case .chat:
//                    TodoTabScreen()
//                case .search:
//                    CartTabScreen()
//                case .timer:
//                    SettingsFormView()
//                case .bell:
//                    Text("Bell")
//                case .user:
//                    Text("User")
//                }
//            }
//            .safeAreaInset(edge: .bottom) {
//                Color.clear.frame(height: 80)
//            }
//            .safeAreaInset(edge: .top) {
//                Color.clear.frame(height: 104)
//            }
//            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
//            .offset(x: isOpen ? 265 : 0)
//            .scaleEffect(isOpen ? 0.9 : 1)
//            .scaleEffect(show ? 0.92 : 1)
//            .ignoresSafeArea()
//        }
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
