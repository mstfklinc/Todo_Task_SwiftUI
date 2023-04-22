//
//  AppVersionView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI

struct AppVersionView: View {
    var imageName : String
    var title : String
    var version : String
    var body: some View {
        
        HStack(spacing: 8){
            Image(systemName: imageName)
                .font(.title)
                .foregroundColor(.red)
                .frame(minWidth: 25, alignment: .leading)
                .accessibility(hidden: true)
            
            Text(title)
            Spacer()
            Text(version)
                .bold()
        }
        .accessibilityElement(children: .combine)
        .padding(.vertical, 10)
        .foregroundColor(.primary)
        
    }
}

struct AppVersionView_Previews: PreviewProvider {
    static var previews: some View {
        AppVersionView(imageName: "info.circle", title: "App Version", version: "1.1.1")
    }
}
