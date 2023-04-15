//
//  ContentView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var showingAddToDoView : Bool = false

    var body: some View {
            ZStack{
                NavigationView{
                    List(0..<5){item in
                        Text("merhaba")
                    }
                    .navigationTitle("Todo")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
                Button {
                    self.showingAddToDoView.toggle()
                } label: {
                    AddButton()
                }.sheet(isPresented: $showingAddToDoView) {
                    AddToDoView()
                }
                
                VStack{
                    Spacer()
                    BottomBar()
                }

            }
            

    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
