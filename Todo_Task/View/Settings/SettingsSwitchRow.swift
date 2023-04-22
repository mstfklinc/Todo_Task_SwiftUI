//
//  SettingsSwitchRow.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI

struct SettingsSwitchRow: View {
    
    var imageName: String
    var title : String
    @State var isPrivate: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .font(.title)
                .foregroundColor(.red)
                .frame(minWidth: 25, alignment: .leading)
                .accessibility(hidden: true)
            Text(title)
                .kerning(1)
            Spacer()
            Toggle(isOn: $isPrivate) {
                Text("")
            }
        }
        .padding(.vertical, 10)
        .foregroundColor(.primary)
        .accessibilityElement(children: .combine)
        .padding(.vertical, 10)
        .foregroundColor(.primary)
    }
}

struct SettingsSwitchRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSwitchRow(imageName: "airplane.circle.fill", title: "Uçak Modu")
    }
}
