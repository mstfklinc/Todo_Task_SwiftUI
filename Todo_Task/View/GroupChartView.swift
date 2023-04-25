//
//  GroupChartView.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 25.04.2023.
//

import SwiftUI

struct GroupChartView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var group: Group
    var isFilteredByGroup = false
    var onGroupTap: (Group) -> Void
    
    @State private var isEditGroupOpen = false
    
    var body: some View {
        VStack{
            HStack{
                GroupIconView(systemIcon: group.systemIcon ?? "calender", color: group.color != nil ? Color(hex: group.color!)! : Color.pink)
                
                Spacer()
                
                if group.todos != nil {
                    Text("\(group.todos!.count)")
                        .foregroundColor(.primary)
                        .bold()
                }
            }
            
            if group.title != nil {
                HStack{
                    Text(group.title!)
                        .font(.system(size: 18))
                        .bold()
                    Spacer()
                }
            }
        }
        .padding(10)
        .background(Color(UIColor.systemGray6))
        .overlay( RoundedRectangle(cornerRadius: 10)
            .stroke(Color(isFilteredByGroup ? UIColor.systemGray5 : UIColor.systemGray6), lineWidth: 10)
        )
        .cornerRadius(10)
        .onTapGesture {
            withAnimation{
                onGroupTap(group)
            }
        }
        .contextMenu{
            VStack{
                Button("Edit Group"){
                    isEditGroupOpen.toggle()
                }
                Button("Delete Group"){
                    withAnimation{
                        PersistenceController.shared.delete(context: moc, object: group)
                    }
                }
            }
        }
    }
}

let group = Group.createFakeGroup()

struct GroupChartView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChartView(group: group, onGroupTap: {_ in})
            .previewLayout(.sizeThatFits)
    }
}
