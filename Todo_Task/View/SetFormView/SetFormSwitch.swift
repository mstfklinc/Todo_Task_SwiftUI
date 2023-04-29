//
//  SetFormSwitch.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormSwitch: View {
    
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

struct SetFormSwitch_Previews: PreviewProvider {
    static var previews: some View {
        SetFormSwitch(icon: "moon.fill", text: "Dark Mode", color: Color.orange)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
