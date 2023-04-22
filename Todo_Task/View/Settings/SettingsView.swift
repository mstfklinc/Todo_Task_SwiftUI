//
//  SettingsView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
    
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                AboutView(title: "Welcome Planner App", accessibilityTitle: "This is Planner App")
                
                SectionHeader(title: "Support", accessibilityTitle: "Support")
                VStack {
                    // MARK: - SHARE
                    
                    SettingsRow(imageName: "square.and.arrow.up", title: "Share") {
                        self.settingsViewModel.showShareSheet = true
                    }
                    .sheet(isPresented: $settingsViewModel.showShareSheet) {
                        ShareSheetView(activityItems: ["Can you beat me in Gradient Game? \n\(Settings.appURL)"])
                            .edgesIgnoringSafeArea(.bottom)
                    }
                    // MARK: - WRITE REVIEW
                    SettingsRow(imageName: "pencil.and.outline", title: "Write a review") {
                        self.settingsViewModel.writeReview()
                    }

                    // MARK: - TWEET ABOUT IT
//                    SettingsRow(imageName: "textbox", title: "Tweet about it") {
//                        self.settingsViewModel.openTwitter(twitterURLApp: Settings.gameTwitterApp, twitterURLWeb: Settings.gameTwitterWeb)
//                    }
                }
                .settingsBackground()
                
                
                SectionHeader(title: "Support", accessibilityTitle: "Support")
                VStack {
                    // MARK: - FEATURE REQUEST
                    SettingsRow(imageName: "wand.and.stars", title: "Feature request") {
                        if MFMailComposeViewController.canSendMail() {
                            self.settingsViewModel.showingFeatureEmail.toggle()
                        } else if let emailUrl = self.settingsViewModel.createEmailUrl(to: Settings.email, subject: "Feature request!", body: "Hello, I have this idea ") {
                            UIApplication.shared.open(emailUrl)
                        } else {
                            self.settingsViewModel.showMailFeatureAlert = true
                        }
                    }
                    .alert(isPresented: $settingsViewModel.showMailFeatureAlert) {
                        Alert(title: Text("No Mail Accounts"), message: Text("Please set up a Mail account in order to send email"), dismissButton: .default(Text("OK")))
                    }
                    .sheet(isPresented: $settingsViewModel.showingFeatureEmail) {
                        MailView(isShowing: self.$settingsViewModel.showingFeatureEmail, result: self.$settingsViewModel.featureResult, subject: "Feature request! [Gradient Game]", message: "Hello, I have this idea ")
                    }

                    // MARK: - REPORT A BUG
                    SettingsRow(imageName: "envelope.fill", title: "Report a bug") {
                        if MFMailComposeViewController.canSendMail() {
                            self.settingsViewModel.showingBugEmail.toggle()
                        } else if let emailUrl = self.settingsViewModel.createEmailUrl(to: Settings.email, subject: "BUG! [Gradient Game]", body: "Oh no, there's a bug ") {
                            UIApplication.shared.open(emailUrl)
                        } else {
                            self.settingsViewModel.showMailBugAlert = true
                        }
                    }
                    .alert(isPresented: self.$settingsViewModel.showMailBugAlert) {
                        Alert(title: Text("No Mail Accounts"), message: Text("Please set up a Mail account in order to send email"), dismissButton: .default(Text("OK")))
                    }
                    .sheet(isPresented: $settingsViewModel.showingBugEmail) {
                        MailView(isShowing: self.$settingsViewModel.showingBugEmail, result: self.$settingsViewModel.bugResult, subject: "BUG!", message: "Oh no, there's a bug ")
                    }
                }
                .settingsBackground()
                
                SectionHeader(title: "Support", accessibilityTitle: "Support")
                VStack {
                    // MARK: - PERSONAL TWITTER ACCOUNT
                    SettingsRow(imageName: "textbox", title: "Creator") {
                        self.settingsViewModel.openTwitter(twitterURLApp: Settings.personalTwitterApp, twitterURLWeb: Settings.personalTwitterWeb)
                    }

                    // MARK: - CREDITS
                    SettingsRow(imageName: "hand.thumbsup", title: "Credits", action: {
                        self.settingsViewModel.showCreditsView = true
                    })
                        .sheet(isPresented: $settingsViewModel.showCreditsView) {
                            CreditsView()
                    }
                    
                    SettingsSwitchRow(imageName: "airplane.circle.fill", title: "Airplane Mode")
                }
                .settingsBackground()
                
                SectionHeader(title: "Support", accessibilityTitle: "Support")
                VStack{
                    // MARK: - APP VERSION
                    
                    
                    
                    AppVersionView(imageName: "info.circle", title: "App version", version: settingsViewModel.appVersion)
                }
                .settingsBackground()
                
                AboutView(title: "Created By Kilinc", accessibilityTitle: "MADE WITH LOVE BY MUSTAFA KİLİNC")
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
