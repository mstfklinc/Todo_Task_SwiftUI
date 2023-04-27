//
//  TodoTabScreen.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 16.04.2023.
//

import SwiftUI

struct TodoTabScreen: View {
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: []) private var groups: FetchedResults<Group>
    
    @State private var searchValue = ""
    @State private var isAddGroupOpen = false
    @State private var isAddTodoOpen = false
    @State private var filteredByGroup: Group? = nil
    
    @State private var showingToDoView : Bool = false
//    @State private var isDetectingLongGesture : Bool = false
    @State private var showingbuttons : Bool = false
    @State private var showingPublishGroupView : Bool = false
    @State private var showingPublishToDoScreen : Bool = false
    
    private let groupCardColumns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    @State private var showingAddToDoView : Bool = false
    var body: some View {
        
        

        NavigationView {
            ScrollView {
                VStack ( alignment: .leading, spacing: 10) {
                    LazyVGrid(columns: groupCardColumns, spacing: 10) {
                        ForEach(groups) {group in
                            GroupChartView(
                                group: group,
                                isFilteredByGroup: group == filteredByGroup,
                                onGroupTap: { g in
                                    if filteredByGroup == g {
                                        filteredByGroup = nil
                                    } else {
                                        filteredByGroup = g
                                    }
                                })
                        }
                    }
                    
                    SectionTitleView(title: "All")
                    
                    TodoListView(query: searchValue, group: filteredByGroup)
                    
                }
//                Spacer()
//                AddButton()
//                    .padding(.vertical, 350)
            }
            .padding(.leading)
            .padding(.trailing)
            .searchable(text: $searchValue, placement: .toolbar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: { isAddGroupOpen = true }) {
                        Image(systemName: "plus.rectangle.on.folder")
                            .sheet (isPresented: $isAddGroupOpen) {
                                PublishGroupScreen()
                            }
                    }
                }
                ToolbarItem (placement: .primaryAction) {
                    Button(action: { isAddTodoOpen = true }) {
                        Image(systemName: "plus.circle")
                            .sheet(isPresented: $isAddTodoOpen) {
                                PublishTodoScreen()
                            }
                    }
                }
                
                ToolbarItem (placement: .primaryAction) {
                    Button(action: { isAddTodoOpen = true }) {
                        Image(systemName: "plus.circle")
                            .sheet(isPresented: $isAddTodoOpen) {
                                PublishTodoScreen()
                            }
                    }
                }
            }
            .navigationViewStyle(.automatic)
            
            
        }
    }
}

struct TodoTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoTabScreen()
    }
}
