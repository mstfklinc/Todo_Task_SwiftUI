//
//  SideMain.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct SideMain: View {
    
    //selected tab
    @State var selectedTab = "Home"
    @State var showMenu = false
    
    @Namespace var animation
    
        var body: some View {
            ZStack{
                Color("blue")
                    .ignoresSafeArea()
                
                //SideMenu
                SideMenu(selectedTab: $selectedTab)
                
                ZStack{
                    
                    //two background cards
                    
                    Color.white
                        .opacity(0.5)
                        .cornerRadius(showMenu ? 15 : 0)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                        .offset(x: showMenu ? -25 : 0)
                        .padding(.vertical, 30)
                    
                    Color.white
                        .opacity(0.4)
                        .cornerRadius(showMenu ? 15 : 0)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                        .offset(x: showMenu ? -50 : 0)
                        .padding(.vertical, 60)
                    
                    SideHome(selectedTab: $selectedTab)
                        .cornerRadius(showMenu ? 15 : 0)
                        .ignoresSafeArea()
                }
                    .scaleEffect(showMenu ? 0.84 : 1)
                    .offset(x: showMenu ? getRect().width - 120 : 0)
                    .ignoresSafeArea()
                    .overlay(
                    
                        Button(action: {
                            withAnimation(.spring()){
                                showMenu.toggle()
                            }
                        }, label: {
                            VStack(spacing: 5){
                                Capsule()
                                    .fill(showMenu ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                
                                    .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                                
                                    .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                                
                                VStack(spacing: 5){
                                    Capsule()
                                        .fill(showMenu ? Color.white : Color.primary)
                                        .frame(width: 30, height: 3)
                                    
                                    Capsule()
                                        .fill(showMenu ? Color.white : Color.primary)
                                        .frame(width: 30, height: 3)
                                        .offset(y: showMenu ? -8 : 0)
                                }
                                .rotationEffect(.init(degrees: showMenu ? 55 : 0))
                            }
                        })
                        
                        .padding()
                        ,alignment: .topLeading
                        
                    )
       
            }
        }
    }


struct SideMain_Previews: PreviewProvider {
    static var previews: some View {
        SideMain()
    }
}

//Extension View to get Screen size.

extension View {
    
    func getRect() -> CGRect{
        
        return UIScreen.main.bounds
        
    }
 
}
