//
//  ShareSheetView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import Foundation
import SwiftUI

struct ShareSheetView : UIViewControllerRepresentable {
    
    typealias CallBack = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) ->Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let callBack: CallBack? = nil
    
    func makeUIViewController(context: Context) -> some UIActivityViewController {
        
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        let excludedActivityTypes: [UIActivity.ActivityType]? = [.assignToContact, .addToReadingList, .openInIBooks, .print, .saveToCameraRoll]
        
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callBack
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //nothing to do here
    }
    
}
