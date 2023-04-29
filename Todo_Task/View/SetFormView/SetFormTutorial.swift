//
//  SetFormTutorial.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormTutorial: View {
    
    var icon : String
    var color : Color
    var text : String
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10 , style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            }
            .frame(width: 33, height: 33, alignment: .center)
            Text(text)
            Spacer()
        }
        .padding(5)
    }
}

struct SetFormTutorial_Previews: PreviewProvider {
    static var previews: some View {
        SetFormTutorial(icon: "book.fill", color: Color.red, text: "Tutorial")
    }
}
