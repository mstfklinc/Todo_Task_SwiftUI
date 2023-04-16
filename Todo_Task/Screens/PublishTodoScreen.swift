//
//  PublishTodoScreen.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 16.04.2023.
//

import SwiftUI

struct PublishTodoScreen: View {
    
    //MARK: ENVIRONMENTS
    @Environment(\.managedObjectContext) private var manageObjectContext
    @Environment(\.dismiss) private var dismiss
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: []) private var groups: FetchedResults<Group>
    
    //MARK:  PROPERTIES
    @State private var title = ""
    @State private var group : UUID?
    @State private var date = Date()
    
    var todo: Todo? = nil
    
    init(todo: Todo? = nil) {
        if let safeTodo = todo{
            self.todo = safeTodo
            self._title = .init(initialValue: safeTodo.title!)
            self._date = .init(initialValue: safeTodo.doDate!)
            self._group = .init(initialValue: safeTodo.group!.id)
        }
    }
    
    private func publisTodo(){
        if self.group == nil{
            return
        }
        
        let selectedGroup = groups.first(where: {$0.id == self.group!})
        
        if todo != nil {
            todo?.title = title
            todo?.group = selectedGroup
            todo?.doDate = date
            
            PersistenceController.shared.save(context: manageObjectContext)
        }else{
            PersistenceController.shared.createTodo(context: manageObjectContext, group: selectedGroup!, title: title, doDate: date)
        }
        
        dismiss()
    }
 
    
    
    var body: some View {
        NavigationView{
            
            Form{
                TextField("Title", text: $title)
                
                Picker("Selected Group", selection: $group){
                    ForEach(groups){
                        Text($0.title!).tag($0.id)
                    }
                }
                
                DatePicker("Do Date", selection: $date, displayedComponents: [.date])
            }//MARK: END FORM
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action:{ dismiss}){
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .primaryAction){
                    Button(action:publisTodo){
                        Text("Done")
                    }
                }
            }//MARK: END TOOLBAR
            .navigationTitle("Publish Todo")
            .navigationBarTitleDisplayMode(.inline)
        }//MARK: END NAVİGATIONVIEW
    }
}

struct PublishTodoScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublishTodoScreen()
    }
}
