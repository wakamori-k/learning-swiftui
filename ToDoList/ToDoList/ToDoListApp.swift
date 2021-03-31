//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/02/19.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
