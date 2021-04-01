//
//  TaskToday.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/04/01.
//

import SwiftUI

struct TaskToday: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time, ascending: true)],
                  predicate: NSPredicate(format: "time BETWEEN {%@, %@}", Date.today as NSDate, Date.tomorrow as NSDate),
                  animation: .default)
    var todoList: FetchedResults<TodoEntity>

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("今日のタスク").font(.footnote).bold().padding()
            List(todoList) { todo in
                TodoDetailRow(todo: todo)
            }
        }.background(Color(UIColor.systemBackground))
        .clipShape(RoundedCorners(tl: 40, tr: 40, bl: 0, br: 0))
        .padding()
    }
}

struct TaskToday_Previews: PreviewProvider {
    static let container = PersistenceController.preview.container
    static let context = container.viewContext
    
    static var previews: some View {
        TaskToday()
            .environment(\.managedObjectContext, context)
    }
}
