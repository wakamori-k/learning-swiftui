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
    
    private func addNewTask() {
        newTask = ""
    }
    
    private func cancelTask() {
        newTask = ""
    }
    
    var body: some View {
        HStack {
            TextField("新しいタスク", text: $newTask) {
                self.addNewTask()
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.addNewTask()
            }) {
                Text("追加")
            }
            Button(action: {
                self.cancelTask()
            }) {
                Text("キャンセル")
            }
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
    }
}
