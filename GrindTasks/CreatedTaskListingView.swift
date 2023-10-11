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
    @State private var isPastAssignedDate = false
    
    
    var body: some View {
        
        
        List {
            ForEach(tasks) { task in
                NavigationLink(value: task) {
                    HStack {
                        if isPastAssignedDate {
                            Image(systemName: "exclamationmark.circle")
                                .imageScale(.large)
                        } else {
                            Image(systemName: "exclamationmark.circle")
                                .imageScale(.large)
                                .opacity(0)
                        }
                    }
                    VStack(alignment: .leading)  {
                        
                        Text(task.title)
                            .font(.headline)
                            .lineLimit(1)
                    }
                    Spacer()
                    
                        VStack(alignment: .trailing) {
                            Text(task.taskFormattedScheduledDate)
                                .font(.subheadline)
                                .bold()
                            if task.completed {
                                Text("Completed")
                                    .font(.body.smallCaps())
                            }
                            
                    }
                        .foregroundStyle(.secondary)
                    
                    
                }
                .onAppear {
                    let currentDate = Date()
                    isPastAssignedDate = currentDate > task.taskAssignedDate
                }
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
