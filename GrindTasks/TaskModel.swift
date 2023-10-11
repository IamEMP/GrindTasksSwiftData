//
//  Tasks.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/6/23.
//

import Foundation
import SwiftData

@Model
class TaskModel {
    var assignedDate: Date
    var completed: Bool
    var content: String
    var title: String
    
    
    init(assignedDate: Date = .now,
         completed: Bool = false,
         content: String = "",
         title: String = ""
         ){
        self.assignedDate = assignedDate
        self.completed = completed
        self.content = content
        self.title = title
    }
}

