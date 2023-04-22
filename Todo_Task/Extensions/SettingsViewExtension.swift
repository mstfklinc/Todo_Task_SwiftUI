//
//  SettingsViewExtension.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import Foundation
import SwiftUI

extension View{
    func settingsBackground() -> some View{
        self
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color(.secondarySystemBackground)))
            .padding(.bottom, 6)
            .padding(.horizontal)
    }
    
    func customHoverEffect() -> some View {
        if #available(macCatalyst 13.4, *), #available(iOS 13.4, *){
            return AnyView(self.hoverEffect())
        }else{
            return AnyView(self)
        }
    }
}
