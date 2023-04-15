//
//  Group.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import Foundation
import CoreData

extension Group{
    static func createFakeGroup(context: NSManagedObjectContext? = nil) ->Group{
        let group = context != nil ? Group(context: context!) : Group()
        group.id = UUID()
        group.title = "Some Group"
        group.color = "#2f42d6"
        group.systemIcon = "list.bullet.circle.fill"
        
        return group
        
    }
}
