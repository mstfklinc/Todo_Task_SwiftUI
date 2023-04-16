//
//  TodoTabScreen.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 16.04.2023.
//

import SwiftUI

struct TodoTabScreen: View {
    @State private var showingAddToDoView : Bool = false
    var body: some View {
        ZStack{
            Button {
                self.showingAddToDoView.toggle()
            } label: {
                AddButton()
            }.sheet(isPresented: $showingAddToDoView) {
                AddToDoView()
            }
        }
    }
}

struct TodoTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoTabScreen()
    }
}
