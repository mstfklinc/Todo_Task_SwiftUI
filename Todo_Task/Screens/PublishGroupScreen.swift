//
//  PublishGroupScreen.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 16.04.2023.
//

import SwiftUI

struct PublishGroupScreen: View {
    
    //MARK: ENVIRONMENTS
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var manageObjectContext
    
    //MARK: OBJECTS
    var group: Group? = nil
    
    //MARK: PROPERTIES
    
    @State private var title = ""
    @State private var color = Color.indigo
    @State private var systemIcon = "calender"
    
    private let colors = [
        Color.indigo, Color.red, Color.blue, Color.cyan, Color.yellow,
        Color.green, Color.mint, Color.purple, Color.teal, Color.pink,
    ]
    
    private let systemIcons = [
        "calendar", "book.closed", "bookmark", "graduationcap", "cart",
        "display", "clock", "network", "phone", "heart"
    ]
    
    private let columns = Array(repeating: GridItem(spacing: 20), count: 5)
    
    private func publishGroup(){
        
        if group != nil {
            group?.title = title
            group?.systemIcon = systemIcon
            group?.color = color.toHex()
            
            PersistenceController.shared.save(context: manageObjectContext)
        }else{
            PersistenceController.shared.createGroup(context: manageObjectContext, title: title, symbolIcon: systemIcon, color: color)
        }
        
        dismiss()
        
    }
    
    init(group: Group? = nil) {
        
        if let safeGroup = group{
            self.group = safeGroup
            
            self._title = .init(initialValue: safeGroup.title!)
            self._color = .init(initialValue: Color(safeGroup.color!))
            self._systemIcon = .init(initialValue: safeGroup.systemIcon!)
        }
    }
    
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                VStack(spacing: 20){
                    
                    VStack(alignment: .center, spacing: 20){
                        
                        GroupIconView(systemIcon: systemIcon, color: color, size: .medium)
                        TextField("Title",text: $title)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        
                    }//MARK: END VSTACK
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
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
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
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
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                }//MARK: END VSTACK
                
            }//MARK: END SCROLLVIEW
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
                    Button(action: publishGroup){
                        Text("Done")
                    }
                }
                
            }//MARK: END TOOLBAR
            .navigationTitle("Publish Group")
            .navigationBarTitleDisplayMode(.inline)
            
        }//MARK: END NAVIGATIONVIEW
    }
}

struct PublishGroupScreen_Previews: PreviewProvider {
    static var previews: some View {
        PublishGroupScreen()
    }
}
