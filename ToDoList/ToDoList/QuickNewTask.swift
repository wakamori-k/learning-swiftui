//
//  QuickNewTask.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/29.
//

import SwiftUI

struct QuickNewTask: View {
    let category: TodoEntity.Category
    @State var newTask: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    private func addNewTask() {
        TodoEntity.create(in: self.viewContext, category: self.category, task: self.newTask)
    }
    
    private func cancelTask() {
        newTask = ""
    }
    
    var body: some View {
        HStack {
            TextField("新しいタスク", text: $newTask, onCommit: {
                self.addNewTask()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.addNewTask()
            }) {
                Text("追加").foregroundColor(.tBlue)
            }
            
            Button(action: {
                self.cancelTask()
            }) {
                Text("キャンセル").foregroundColor(.tRed)
            }
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    static let container = PersistenceController.preview.container
    static let context = container.viewContext
    
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
