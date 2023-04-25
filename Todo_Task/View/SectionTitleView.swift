//
//  SectionTitleView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct SectionTitleView: View {
    
    var title: String
    
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 24))
                .bold()
            Spacer()
        }
    }
}

struct SectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleView(title: "Section Title")
            .previewLayout(.sizeThatFits)
    }
}
