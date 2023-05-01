//
//  SetFormRowLinkView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetFormRowLinkView: View {
    
    var icon : String
    var color : Color
    var text : String
    var link : String
    
    var body: some View {
        
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
                .foregroundColor(Color.gray)
            
            Spacer()
            
            Button(action: {
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
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

struct SetFormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SetFormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://github.com/mstfklinc")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
