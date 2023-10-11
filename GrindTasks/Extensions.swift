//
//  Extensions.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/11/23.
//

import Foundation
import SwiftData

extension TaskModel {
    var taskStatus: String {
        if completed {
            return "Completed"
        } else {
            return "Incomplete"
        }
    }
    
    var taskAssignedDate: Date {
        get { assignedDate }
        set { assignedDate = newValue}
    }
    
    var taskFormattedScheduledDate: String {
        taskAssignedDate.formatted(date: .abbreviated, time: .omitted)
    }
}
