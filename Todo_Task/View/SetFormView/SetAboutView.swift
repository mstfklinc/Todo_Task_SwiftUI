//
//  SetAboutView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI

struct SetAboutView: View {
    var title : String
    var accessibilityTitle : String
    var body: some View {
        
        Text(title.uppercased())
            .foregroundColor(.secondary)
            .font(.caption)
            .kerning(1)
            .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
            .accessibility(label: Text(accessibilityTitle))
            .padding(.top)
        
    }
}

struct SetAboutView_Previews: PreviewProvider {
    static var previews: some View {
        SetAboutView(title: "Welcome My Todo App", accessibilityTitle: "Welcome My Todo App")
    }
}
