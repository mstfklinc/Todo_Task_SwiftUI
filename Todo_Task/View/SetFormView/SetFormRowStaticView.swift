//
//  SetFormRowStaticView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormRowStaticView: View {
    
    var icon : String
    var firstText : String
    var secondText : String
    var color : Color
    
    var body: some View {
       
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            .frame(width: 33, height: 33, alignment: .center)
            Text(firstText)
            Spacer()
            Text(secondText)
                .foregroundColor(Color.gray)
        }
        .padding(5)
    }
}

struct SetFormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        SetFormRowStaticView(icon: "apps.iphone", firstText: "Application", secondText: "Todo", color: Color.blue)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
