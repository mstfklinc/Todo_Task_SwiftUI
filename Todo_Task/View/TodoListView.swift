//
//  TodoListView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct TodoListView: View {
    @FetchRequest private var todos: FetchedResults<Todo>
    
    var body: some View {
        ForEach(todos) { todo in
            ListItemView(todo: todo)
        }
    }
    
    init(query: String, group: Group? = nil) {
        let sortByDate = NSSortDescriptor(key: #keyPath(Todo.createdAt), ascending: false)
        
        if group != nil {
            if query.isEmpty {
                _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "group = %@", group!))
            } else {
                _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "group = %@ && title CONTAINS[cd] %@", group!, query))
            }
        } else if !query.isEmpty {
            _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "title CONTAINS[cd] %@", query))
        } else {
            _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate])
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(query: "")
    }
}
