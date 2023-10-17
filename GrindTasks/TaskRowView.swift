//
//  TaskRowView.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/17/23.
//

import SwiftUI
import SwiftData

struct TaskRowView: View {
   @State var tasks: TaskModel
    @State private var isPastAssignedDate = false
    var body: some View {
        NavigationLink(value: tasks) {
            HStack {
                if isPastAssignedDate {
                    Image(systemName: "exclamationmark.circle")
                        .imageScale(.large)
                    
                    
                } else {
                    Image(systemName: "exclamationmark.circle")
                        .imageScale(.large)
                        .opacity(0)
                }
                
                VStack(alignment: .leading)  {
                    
                    Text(tasks.title)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(tasks.taskFormattedScheduledDate)
                        .font(.subheadline)
                    
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    if tasks.completed {
                        Text("Completed")
                            .font(.body.smallCaps())
                    }
                    
                }
                .foregroundStyle(.secondary)
            }
        }
        .onAppear {
            let currentDate = Date()
            
            isPastAssignedDate = currentDate > tasks.taskAssignedDate
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TaskModel.self,
        configurations: config)
        return TaskRowView(tasks: .init())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
