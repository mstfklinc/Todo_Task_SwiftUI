//
//  SettingsFormView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 29.04.2023.
//

import SwiftUI
import MessageUI

struct SettingsFormView: View {
    
    //    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    var email: String = "mustafakilinc429@gmail.com"
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 10){
                
                Form {
                    
                    //MARK: SECTION SET VIEW
                    Section(header: Text("Set View")){
                        
                        SetFormSwitch(icon: "moon.circle", text: "Dark Mode", color: Color.blue)
                        
                    }
                    
                    //MARK: SECTION NOTIFICATION
                    
                    Section(header: Text("Notification"), footer: Text("deneme footer")) {
                        SetFormNotification(icon: "bell.fill", text: "Notification", color: Color.red)
                    }
                    
                    //MARK: SECTION SUPPORT
                    Section(header: Text("Support")){
                        
                        SetFormSupportView(icon: "message.circle.fill", color: Color.pink, text: "Support", email: self.email){
                            self.settingsViewModel.writeReview()
                        }
                            
                            SetFormSupportView(icon: "pencil", color: Color.orange, text: "Feedback", email: self.email)
                            SetFormSupportView(icon: "star", color: Color.yellow, text: "Feedback", email: self.email)
                            
                            
                        }
                        
                        //MARK: SECTION TUTORIAL
                        Section(header: Text("Tutorıal")){
                            SetFormTutorial(icon: "book.fill", color: Color.red, text: "Tutorial")
//                                self.settingsViewModel.showTutorialsView = true
                            
                            
//                            .sheet(isPresented: $settingsViewModel.showCreditsView) {
//                                TutorialsMainView()
//                        }
                       
                    }
                        
                        //MARK: SECTION FOLLOW SOCIAL MEDIA
                        Section(header: Text("Follow us Social Media")){
                            
                            SetFormRowLinkView(icon: "link.circle.fill", color: Color.blue , text: "Twitter", link: "https://twitter.com/mstfklinc")
                            
                            SetFormRowLinkView(icon: "link.circle.fill", color: Color.blue, text: "Github", link: "https://github.com/mstfklinc")
                            
                        }
                        
                     
                        
                        //MARK: SECTION ABOUT THE APPLICATION
                        Section(header: Text("About the application")){
                            
                            SetFormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo", color: Color.red)
                            SetFormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "Iphone, Ipad", color: Color.green)
                            SetFormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Kilinc", color: Color.orange)
                            SetFormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Kilinc", color: Color.yellow)
                            
                        }
                        
                        
                        //MARK: SECTION APP VERSION
                        Section(header: Text("App Version")){
                            SetFormApplicationVersionRowmView(icon: "info.circle", versionNumber: "1.0.0")
                        }
                        
                        Section(header: Text("Copyrıght © All Rıght Reserved.\nBy kılınc🇹🇷")){
                            //footer
                        }
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                        
                    }
//                .toolbar{
//
//                    ToolbarItem(placement: .navigationBarLeading){
//                        Button {
//                            dismiss()
//                        } label: {
//                            Text("Cancel")
//                        }
//
//                    }
//
//                }
                    
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)

                    .navigationBarTitle("Settings", displayMode: .inline)
                    
                    //MARK: FOOTER
                    
                    
                }
            }
        }
    }


struct SettingsFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFormView()
    }
}
    

