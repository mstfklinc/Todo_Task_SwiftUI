//
//  CustomCorners.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct CustomCorners: Shape {
   
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
        
    }
    
}
