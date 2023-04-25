//
//  CheckBoxView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct CheckBoxView: View {
    var label: String?
    var onToggle: (() -> Void)?
    
    @State private var checked = false
    
    init (label: String? = nil, defaultChecked: Bool? = false, onToggle: (() -> Void)? = {}) {
        self.label = label
        self.onToggle = onToggle
        _checked = .init(initialValue: defaultChecked ?? false)
    }
    
    var body: some View {
        HStack {
            if checked {
                Image(systemName: "checkmark.square")
                    .foregroundColor(.indigo)
            } else {
                Image(systemName: "square")
            }
            
            if label != nil {
                Text(label!)
            }
        }.onTapGesture {
            withAnimation {
                checked.toggle()
                
                if onToggle != nil {
                    (onToggle!)()
                }
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
            .previewLayout(.sizeThatFits)
        CheckBoxView(label: "Some Label")
            .previewLayout(.sizeThatFits)
    }
}
