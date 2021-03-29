//
//  TodoList.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/29.
//

import UIKit
import SwiftUI
import CoreData

struct TodoList: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        animation: .default)
    var todoList: FetchedResults<TodoEntity>

    let category: TodoEntity.Category
    
    var body: some View {
        VStack {
            List {
                ForEach(todoList) { todo in
                    if todo.category == self.category.rawValue {
                        Text(todo.task ?? "no title")
                    }
                }
            }
            QuickNewTask(category: category)
            padding()
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { storeDescriptions, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    static let context = container.viewContext
    
    
    static var previews: some View {
        // テストデータの全削除
        let request = NSBatchDeleteRequest(
            fetchRequest: NSFetchRequest(entityName: "TodoEntity"))
        try! container.persistentStoreCoordinator.execute(request,
                                                          with: context)

        // データを追加
        TodoEntity.create(in: context,
                          category: .ImpUrg_1st, task: "炎上プロジェクト")
        TodoEntity.create(in: context,
                          category: .ImpNUrg_2nd, task: "自己啓発")
        TodoEntity.create(in: context,
                          category: .NImpUrg_3rd, task: "意味のない会議")
        TodoEntity.create(in: context,
                          category: .NImpNUrg_4th, task: "暇つぶし")

        
        return TodoList(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
