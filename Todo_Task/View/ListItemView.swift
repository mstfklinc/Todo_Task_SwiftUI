//
//  ListItemView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI
import CoreData

struct ListItemView: View {
    
    @Environment(\.managedObjectContext) private var moc

    @ObservedObject var todo : Todo
    
    @State private var doesClose = false
    @State private var isEditTodoOpen = false
    
    private func deleteTodo(object: NSManagedObject){
        PersistenceController.shared.delete(context: moc, object: object)
    }
    
    var body: some View {
        
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    HStack {
//                        CheckBoxView(defaultChecked: todo.done, onToggle: {
//                            todo.toggle(context: moc)
//                        })
                        if todo.title != nil {
                            Text(todo.title!)
                                .onTapGesture {
                                    isEditTodoOpen.toggle()
                                }
                                .sheet(isPresented: $isEditTodoOpen) {
                                    PublishTodoScreen(todo: todo)
                                }
                        }
                    }
                    
                    if todo.group != nil {
                        Text("\(todo.group!.title!) | \(todo.readableDoDate)")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                    }
                }
                
                Spacer()
                
//                Image(systemName: "trash")
//                    .onTapGesture {
//                        deleteTodo(object: todo)
//                    }
            }
            .padding(.horizontal, 10)
            Divider()
        }
    }
}
let todo = Todo.createFakeTodo(group: Group())

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(todo: todo)
            .previewLayout(.sizeThatFits)
    }
}
