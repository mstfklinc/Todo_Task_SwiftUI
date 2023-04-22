//
//  SettingsRow.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI

struct SettingsRow: View {
    
    var imageName : String
    var title : String
    var action : (() -> ()) = { }
    
    var body: some View {
        
        Button(action: {
            self.action()
            FeedbackManager.mediumFeedback()
        }){
            HStack(spacing: 8){
                Image(systemName: imageName)
                    .font(.title)
                    .foregroundColor(.blue)
                    .frame(minWidth: 25, alignment: .leading)
                    .accessibility(hidden: true)
                    
                
                Text(title)
                    .kerning(1)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.vertical, 10)
            .foregroundColor(.primary)
        }
        
        
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(imageName: "airplane", title: "Feature request")
    }
}
