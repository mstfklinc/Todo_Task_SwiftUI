//
//  BottomBar.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import SwiftUI

struct BottomNavBarItem : View{
    let image : Image
    let action:() -> Void
    
    var body: some View{
        Button(action: action){
            image.frame(maxWidth: .infinity)
        }
    }
}

struct BottomBar: View {
    
    @State private var showingAddHomeView : Bool = false
    @State private var showingChartView : Bool = false
    @State private var showingSettingsView : Bool = false
    
    var body: some View{
        
        
        HStack{
            
                BottomNavBarItem(image: Image(systemName: "list.dash"), action: {
                    self.showingAddHomeView.toggle()
                })
                .sheet(isPresented: $showingAddHomeView) {
                        Home()
                    }
           
                BottomNavBarItem(image: Image(systemName: "chart.bar.xaxis"), action: {
                    self.showingChartView.toggle()
                })
                .sheet(isPresented: $showingChartView) {
                    CartTabScreen()
                }
            
   
                BottomNavBarItem(image: Image(systemName: "gear"), action: {
                    self.showingSettingsView.toggle()
                })
                .sheet(isPresented: $showingSettingsView) {
                    SettingsView()
                }

            
            
        }.padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x:2, y:6)
            .foregroundColor(Color.blue)
            .font(.system(size: 25))
    }
    
}



struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
