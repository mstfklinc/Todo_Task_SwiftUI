//
//  GroupIconView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 16.04.2023.
//

import SwiftUI

enum GroupIconSize{
    case medium;
    case large;
}

struct GroupIconView: View {
    
    var systemIcon : String
    var color : Color
    var size: GroupIconSize = .medium
    
    var sizes: (frame: Double, icon: Double){
        get{
            switch size {
            case .medium:
                return (frame: 35, icon: 15)
            case .large:
                return (frame: 50, icon: 50)
            }
        }
    }
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: sizes.frame, height: sizes.frame)
            .overlay(
            
                Image(systemName: systemIcon)
                    .font(.system(size: sizes.icon))
                    .foregroundColor(.white)
                
            )
    }
}

struct GroupIconView_Previews: PreviewProvider {
    static var previews: some View {
        GroupIconView(systemIcon: "calendar", color: Color.indigo)
            .previewLayout(.sizeThatFits)
    }
}
