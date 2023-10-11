//
//  GrindTasksApp.swift
//  GrindTasks
//
//  Created by Ethan Phillips on 10/6/23.
//

import SwiftUI
import SwiftData

@main
struct GrindTasksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TaskModel.self)
    }
}
