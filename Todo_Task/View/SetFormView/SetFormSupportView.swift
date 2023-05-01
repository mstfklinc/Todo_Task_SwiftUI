//
//  SetFormSupportView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormSupportView: View {
    var icon : String
    var color : Color
    var text : String
    var email : String
    var action : (() -> ()) = { }
    
    var body: some View {
        
        Button(action: {
            self.action()
            FeedbackManager.mediumFeedback()
        }){
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(color)
                    Image(systemName: icon)
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                }
                .frame(width: 33, height: 33, alignment: .center)
                Text(text)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Button(action: {
                    guard let url = URL(string: self.email), UIApplication.shared.canOpenURL(url) else {
                        return
                    }
                    UIApplication.shared.open(url as URL)
                }){
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                }
                .accentColor(Color(.systemGray2))
            }
            .padding(5)
        }
        
 
    }
}

struct SetFormSupportView_Previews: PreviewProvider {
    static var previews: some View {
        SetFormSupportView(icon: "plus.message", color: Color.pink, text: "Support And Feedback", email: "mustafakilinc429@gmail.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

