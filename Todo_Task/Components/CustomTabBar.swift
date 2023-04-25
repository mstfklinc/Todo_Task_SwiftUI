//
//  CustomTabBar.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI


enum Tab: String, CaseIterable{
    
    case house
    case checklist
    case gear
    
}

struct CustomTabBar: View {
    
    @Binding var selectedTab : Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor : Color {
        
        switch selectedTab {
            
        case .house:
            return .blue
        case .checklist:
            return .green
        case .gear:
            return .orange
        }
        
    }
    
    var body: some View {
        
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                            }
                        }
                    Spacer()
                    
                }
                
            }
            .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x:2, y:6)
                .foregroundColor(Color.blue)
                .font(.system(size: 25))
        }
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
