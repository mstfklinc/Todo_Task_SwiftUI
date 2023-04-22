//
//  FeedBackManager.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import Foundation
import UIKit

enum FeedbackManager {
    static func mediumFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}
