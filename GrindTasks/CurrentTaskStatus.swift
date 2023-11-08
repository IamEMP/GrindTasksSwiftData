//
//  TaskStatus.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 11/8/23.
//

import Foundation
import SwiftData

enum Status {
    case all, incomplete, completed, scheduled
}

class TaskStatus: ObservableObject  {
    
    @Published var filterStatus = Status.incomplete
    
    init(filterStatus: Status = Status.incomplete) {
        self.filterStatus = filterStatus
    }
}
