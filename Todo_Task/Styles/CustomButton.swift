//
//  CustomButton.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 26.04.2023.
//


import SwiftUI

struct LargeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "F77D8E"))
            .foregroundColor(.white)
            .mask(RoundedCorner(radius: 20, corners: [.topRight, .bottomLeft, .bottomRight]))
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color(hex: "F77D8E").opacity(0.5) as! Color, radius: 20, x: 0, y: 10)
    }
}

extension View {
    func largeButton() -> some View {
        modifier(LargeButton())
    }
}
