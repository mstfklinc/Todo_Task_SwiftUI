//
//  OnboardScreen.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 22.04.2023.
//

import SwiftUI
import AboutKit

struct OnboardScreen: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Welcome My Todo app")
                .font(.system(size: 50))
                .fontWeight(.bold)
            
                .padding(.horizontal)
                .padding(.vertical)
            
            HStack(spacing: 10){
                
                Image(systemName: "checkmark.seal")
                    .foregroundColor(.green)
                
                VStack(alignment: .leading){
                    Text("Feature one")
                    Text("this is the first feature")
                        .foregroundColor(.secondary)
                        
                }

            }
            .padding(.vertical)
            
            HStack(spacing: 10){
                
                Image(systemName: "xmark.bin.fill")
                    .foregroundColor(.red)
                
                VStack(alignment: .leading){
                    Text("Feature one")
                        
                    Text("this is the first feature")
                        .foregroundColor(.secondary)
                }

            }
            .padding(.vertical)
            
            HStack(spacing: 10){
                
                Image(systemName: "pencil")
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading){
                    Text("Feature one")
                        
                    Text("this is the first feature")
                        .foregroundColor(.secondary)
                }

            }
            Spacer()
            
            Button("Continue"){
                Text("Tapped Continue button")
                Home()
            }
            .padding(.leading, 120)
            .padding(.bottom, 20)
            .buttonStyle(.borderedProminent)

        }
    }
}

struct OnboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardScreen()
    }
}
