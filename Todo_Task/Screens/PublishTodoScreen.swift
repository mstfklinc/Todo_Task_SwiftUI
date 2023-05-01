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
    
    @State private var color = Color.indigo
    @State private var systemIcon = "calender"
    
    private let colors = [
        Color.indigo, Color.red, Color.blue, Color.cyan, Color.yellow,
        Color.green, Color.mint, Color.purple, Color.teal, Color.pink,
    ]
    
    private let systemIcons = [
        "calendar", "book.closed", "bookmark", "graduationcap", "cart",
        "display", "clock", "network", "phone", "heart",
    ]
    
    private let columns = Array(repeating: GridItem(spacing: 60), count: 5)
    
    var todo: Todo? = nil
    
//    private func publishTodo(){
//
//        if todo != nil {
//            todo?.title = title
//            todo?.systemIcon = icon
//            todo?.doDate = date
//            todo?.color = color.toHex()
//
//            PersistenceController.shared.save(context: manageObjectContext)
//        }else{
//            PersistenceController.shared.createTodo(context: manageObjectContext, group: selectedGroup, title: title, doDate: date)
//
//        }
//
//        dismiss()
//
//    }
    
//    init(todo: Todo? = nil) {
//        if let safeTodo = todo{
//            self.todo = safeTodo
//            self._title = .init(initialValue: safeTodo.title!)
//            self._date = .init(initialValue: safeTodo.doDate!)
//            self._color = .init(initialValue: safeTodo.color!)
//            self._systemIcon = .init(initialValue: safeTodo.icon!)
//            self._group = .init(initialValue: safeTodo.group!.id)
//        }
//    }
    
    init(todo: Todo? = nil) {
        
        if let safeTodo = todo{
            self.todo = safeTodo
            
            self._title = .init(initialValue: safeTodo.title!)
            self._date = .init(initialValue: safeTodo.doDate!)
            self._color = .init(initialValue: Color(safeTodo.color!))
            self._systemIcon = .init(initialValue: safeTodo.systemIcon!)
            self._group = .init(initialValue: safeTodo.group!.id)
        }
    }
    
    private func publishTodo(){
        if self.group == nil{
            return
        }
        
        let selectedGroup = groups.first(where: {$0.id == self.group!})
        
        if todo != nil {
            todo?.title = title
            todo?.group = selectedGroup
            todo?.doDate = date
            todo?.color = color.toHex()
            todo?.systemIcon = systemIcon
            
            
            PersistenceController.shared.save(context: manageObjectContext)
        }else{
            PersistenceController.shared.createTodo(context: manageObjectContext, group: selectedGroup!, title: title, doDate: date)
        }
        
        dismiss()
    }
 
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(spacing: 20){
                    
                        VStack(alignment: .center, spacing: 20) {
                            
                            GroupIconView(systemIcon: systemIcon, color: color, size: .medium)
                            TextField("Title",text: $title)
                                .padding(10)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                            
                          
                            
                        }//MARK: END Vstack
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        
                    
                        VStack(spacing: 20) {
                            Picker("Selected Group", selection: $group){
                                ForEach(groups){
                                    Text($0.title!).tag($0.id)
                                }
                            }
                        }
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                    
                    ScrollView(.horizontal){
                        LazyVGrid(columns: columns, spacing: 20){
                            
                            ForEach(colors, id: \.self){ colm in
                                
                                ZStack{
                                    
                                    if colm.toHex()! == color.toHex()!{
                                        Circle()
                                            .foregroundColor(colm)
                                            .frame(width: 45, height: 45)
                                            .opacity(0.3)
                                    }
                                    
                                    Circle()
                                        .foregroundColor(colm)
                                        .frame(width: 30, height: 30)
                                        .padding(15)
                                    
                                }//MARK: END ZSTACK
                                .onTapGesture {
                                    withAnimation{
                                        self.color = colm
                                    }
                                }
                                
                            }
                            
                        }//MARK: END LAZYVGRID
                        .padding(.leading)
                        
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                       
                    ScrollView(.horizontal){
                        LazyVGrid (columns: columns, spacing: 20) {
                            ForEach(systemIcons, id: \.self) { icon in
                                GroupIconView(systemIcon: icon, color: self.systemIcon == icon ? self.color : Color(UIColor.systemGray3))
                                    .onTapGesture {
                                        withAnimation {
                                            self.systemIcon = icon
                                        }
                                    }
                            }
                        }//MARK: END LAZYVGRID
                        .padding(.leading)
                     
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                  
                    
             
                }//MARK: END Vstack
            }//MARK: END ScrollView
            .padding()
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }

                }
                
                ToolbarItem(placement: .primaryAction){
                    Button(action: publishTodo){
                        Text("Done")
                    }
                }
                
            }//MARK: END TOOLBAR
            .navigationTitle("Publish Todo")
            .navigationBarTitleDisplayMode(.inline)
        }//MARK: END NavigationView
        
//        NavigationView{
//
//            Form{
//                TextField("Title", text: $title)
//
//                Picker("Selected Group", selection: $group){
//                    ForEach(groups){
//                        Text($0.title!).tag($0.id)
//                    }
//                }
//
//                DatePicker("Do Date", selection: $date, displayedComponents: [.date])
//            }//MARK: END FORM
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading){
//                    Button {
//                        dismiss()
//                    } label: {
//                        Text("Cancel")
//                    }
//
//                }
//
//                ToolbarItem(placement: .primaryAction){
//                    Button(action: publishTodo){
//                        Text("Done")
//                    }
//                }
//            }//MARK: END TOOLBAR
//            .navigationTitle("Publish Todo")
//            .navigationBarTitleDisplayMode(.inline)
//        }//MARK: END NAVİGATIONVIEW
    }
}

struct PublishTodoScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublishTodoScreen()
    }
}
