//
//  TodoDetailRow.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/30.
//

import SwiftUI

struct TodoDetailRow: View {
    @ObservedObject var todo: TodoEntity
    var hideIcon = false
    
    var body: some View {
        HStack {
            if !hideIcon {
                CategoryImage(TodoEntity.Category(rawValue: todo.category))
            }
            CheckBox(checked: Binding(get: {
                self.todo.state == TodoEntity.State.done.rawValue
            }, set: {
                self.todo.state = $0 ? TodoEntity.State.done.rawValue : TodoEntity.State.todo.rawValue
            })) {
                if self.todo.state == TodoEntity.State.done.rawValue {
                    Text(self.todo.task ?? "no title").strikethrough()
                } else {
                    Text(self.todo.task ?? "no title")
                }
            }.foregroundColor(self.todo.state == TodoEntity.State.done.rawValue ? .secondary : .primary)
        }.gesture(DragGesture().onChanged({ value in
            if value.predictedEndTranslation.width > 200 {
                if self.todo.state != TodoEntity.State.done.rawValue {
                    self.todo.state = TodoEntity.State.done.rawValue
                }
            } else if value.predictedEndTranslation.width < -200 {
                if self.todo.state != TodoEntity.State.todo.rawValue {
                    self.todo.state = TodoEntity.State.todo.rawValue
                }
            }
        }))
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let container = PersistenceController.preview.container
        let context = container.viewContext
        
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来への人間関係づくり"
        newTodo.state = TodoEntity.State.done.rawValue
        newTodo.category = 0
        let newTodo1 = TodoEntity(context: context)
        newTodo1.task = "クレームへの対応"
        newTodo1.state = TodoEntity.State.done.rawValue
        newTodo1.category = 1
        let newTodo2 = TodoEntity(context: context)
        newTodo2.task = "無意味な接待や付き合い"
        newTodo2.state = TodoEntity.State.done.rawValue
        newTodo2.category = 2
        let newTodo3 = TodoEntity(context: context)
        newTodo3.task = "長時間、必要以上の息抜き"
        newTodo3.state = TodoEntity.State.done.rawValue
        newTodo3.category = 3
        
        return VStack(alignment: .leading) {
            VStack {
                TodoDetailRow(todo: newTodo)
                TodoDetailRow(todo: newTodo, hideIcon: true)
                TodoDetailRow(todo: newTodo1)
                TodoDetailRow(todo: newTodo2)
                TodoDetailRow(todo: newTodo3)
            }.environment(\.managedObjectContext, context)
        }
    }
}
