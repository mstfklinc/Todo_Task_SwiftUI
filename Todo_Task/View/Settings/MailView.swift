//
//  MailView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import Foundation
import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    
    
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    let subject: String
    let message: String
    let recipientEmail: String = Settings.email
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var isShowing : Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer{ isShowing = false}
            guard error == nil else{
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
        
    }
    
    func  makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> some MFMailComposeViewController {
        
        let mailViewController = MFMailComposeViewController()
        mailViewController.setToRecipients([recipientEmail])
        mailViewController.setSubject(subject)
        mailViewController.setMessageBody(message, isHTML: false)
        mailViewController.mailComposeDelegate = context.coordinator
        return mailViewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //updateViewController
    }
}
