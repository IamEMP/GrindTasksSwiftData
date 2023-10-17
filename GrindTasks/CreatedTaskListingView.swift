//
//  CreatedTaskListingView.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/6/23.
//

import SwiftUI
import SwiftData

struct CreatedTaskListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\TaskModel.title)]) var tasks: [TaskModel]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                TaskRowView(tasks: task)
            }
            .onDelete(perform: deleteTasks)
        }
    }
        
    
    init(sort: SortDescriptor<TaskModel>, searchString: String) {
        _tasks = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteTasks(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
}

#Preview {
    CreatedTaskListingView(sort: SortDescriptor(\TaskModel.title), searchString: "")
        
}
