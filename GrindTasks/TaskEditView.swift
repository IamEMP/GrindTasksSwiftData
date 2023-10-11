//
//  TaskEditView.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/6/23.
//

import SwiftUI
import SwiftData

struct TaskEditView: View {
    @Bindable var task: TaskModel
    
    var body: some View {
        Form {
            Section {
                VStack {
                    TextField("Enter new task here...", text: $task.title)
                    
                    DatePicker("Select a Date", selection: $task.assignedDate)
                        .datePickerStyle(.graphical)
                }
            }
            
            
            Section {
                VStack(alignment: .leading) {
                    Text("Basic Information")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    TextField("Enter Task Description", text: $task.content)
                        .textFieldStyle(.automatic)
                }
            }
        }
        .navigationTitle("Edit Tasks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TaskModel.self,
        configurations: config)
        return TaskEditView(task: .init())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
