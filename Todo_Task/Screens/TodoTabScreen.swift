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
    @State private var showingSettingsScreen : Bool = false
    
    @State var isOpen = false
    @State var show = false
    
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
                    
                    SectionTitleView(title: "All Issues")
                    
                    TodoListView(query: searchValue, group: filteredByGroup)
                    
                }
//                Spacer()
//                AddButton()
                  
            }
            .padding(.leading)
            .padding(.trailing)
            .searchable(text: $searchValue, placement: .toolbar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: { isAddGroupOpen = true }) {
                        Image(systemName: "plus.rectangle.on.folder")
                            .frame(width: 36, height: 36)
                            .background(.white)
                            .mask(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                            .sheet (isPresented: $isAddGroupOpen) {
                                PublishGroupScreen()
                            }
                    }
                }
                ToolbarItem (placement: .primaryAction) {
                    Button(action: { isAddTodoOpen = true }) {
                        Image(systemName: "plus.circle")
                            .frame(width: 36, height: 36)
                            .background(.white)
                            .mask(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                            .sheet(isPresented: $isAddTodoOpen) {
                                PublishTodoScreen()
                            }
                    }
                }
                
                ToolbarItem (placement: .primaryAction) {
                    Button(action: { showingSettingsScreen = true }) {
                        Image(systemName: "gear")
                            .frame(width: 36, height: 36)
                            .background(.white)
                            .mask(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                            .sheet(isPresented: $showingSettingsScreen) {
                                SettingsFormView()
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
