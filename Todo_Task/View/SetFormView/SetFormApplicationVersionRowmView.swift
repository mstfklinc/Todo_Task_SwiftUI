//
//  SetFormApplicationVersionRowmView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormApplicationVersionRowmView: View {
    
    var icon : String
    var versionNumber : String
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.blue)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            .frame(width: 33, height: 33, alignment: .center)
            Text(versionNumber)
            Spacer()
        }
        .padding(5)
    }
}

struct SetFormApplicationVersionRowmView_Previews: PreviewProvider {
    static var previews: some View {
        SetFormApplicationVersionRowmView(icon: "info.circle", versionNumber: "1.0.0")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
