//
//  SectionHeader.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI

struct SectionHeader: View {
    var title : String
    var accessibilityTitle : String
    var body: some View {
        
        VStack(alignment: .leading){
            Text(title.uppercased())
                .foregroundColor(.secondary)
                .font(.system(size: 15))
                .kerning(1)
                .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
                .accessibility(label: Text(accessibilityTitle))
                .padding()
        }
        .padding(.leading, -250)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: "Support", accessibilityTitle: "Support")
    }
}
