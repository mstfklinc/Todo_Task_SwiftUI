//
//  SetFormNotification.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormNotification: View {
    
    
    @State var isenabled : Bool = true
    
    var icon : String
    var text : String
    var color : Color
    
    var body: some View {
        
        HStack(spacing: 8) {
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.white)
                    
            }
            .frame(width: 30, height: 30, alignment: .center)
            
            Text(text)
            Spacer()
            Toggle(isOn: $isenabled) {
                Text("")
            }
        }
        .padding(5)
    }
}

struct SetFormNotification_Previews: PreviewProvider {
    static var previews: some View {
        SetFormNotification(icon: "bell.fill", text: "Notification", color: Color.red)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
