//
//  ContentView.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [TaskModel]()
    @State private var sortOrder = SortDescriptor(\TaskModel.title)
    @State private var searchText = ""

    
    var body: some View {
        NavigationStack(path: $path) {
            CreatedTaskListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Tasks")
                .navigationDestination(for: TaskModel.self, destination: TaskEditView.init)
                .searchable(text: $searchText)
            
            
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            addTask()
                        }, label: {
                            Label("Add new Task", systemImage: "plus")
                        })
                    }
                }
        }
    }
    
    func addTask() {
        let task = TaskModel()
        modelContext.insert(task)
        path = [task]
    }
}

#Preview {
    ContentView()
}
