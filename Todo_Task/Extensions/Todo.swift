//
//  Todo.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import Foundation
import CoreData

extension Todo{
    static func createFakeTodo(group: Group, context: NSManagedObjectContext? = nil) -> Todo{
        
        let newTodo = context != nil ? Todo(context: context!) : Todo()
        newTodo.group = group
        newTodo.id = UUID()
        newTodo.title = "Some Todo"
        newTodo.color = "#2f42d6"
        newTodo.systemIcon = "list.bullet.circle.fill"
        newTodo.createdAt = Date()
        newTodo.doDate = Date()
        
        return newTodo
        
    }
    
    var readableDoDate: String{
        get{
            let df = DateFormatter()
            df.dateFormat = "MMM dd,yyyy"
            
            if(self.doDate != nil){
                return df.string(from: self.doDate!)
            }
            
            return ""
        }
    }
    
    func toggle(context: NSManagedObjectContext){
        self.done.toggle()
        
//        PersistenceController.shared.save(context: context)
    }
    
}
