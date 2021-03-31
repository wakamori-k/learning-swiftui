//
//  EditTask.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/31.
//

import SwiftUI

import SwiftUI

struct EditTask: View {
    @ObservedObject var todo: TodoEntity
    @State var showingSheet = false
    var categories: [TodoEntity.Category] = [.ImpUrg_1st, .ImpNUrg_2nd, .NImpUrg_3rd, .NImpNUrg_4th]
    @Environment(\.managedObjectContext) var viewContext
    
    private func save() {
        do {
            try self.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    private func delete() {
        viewContext.delete(todo)
        save()
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("タスク")) {
                TextField("タスクを入力", text: Binding($todo.task, "new task"))
            }
            
            Section(header: Toggle(isOn: Binding(isNotNil: $todo.time, defaultValue: Date())) { Text("時間を指定") } ) {
                if todo.time != nil {
                    DatePicker(selection: Binding($todo.time, Date()), label: {Text("日時")})
                } else {
                    Text("時間未設定").foregroundColor(.secondary)
                }
            }
            
            Picker(selection: $todo.category, label: Text("種類")) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        CategoryImage(category)
                        Text(category.toString())
                    }.tag(category.rawValue)
                }
            }
            
            Section(header: Text("操作")) {
                Button(action: {
                    self.showingSheet = true
                }, label: {
                    HStack(alignment: .center) {
                        Image(systemName: "minus.circle.fill")
                        Text("削除")
                    }.foregroundColor(.tRed)
                })
            }
        }.navigationBarTitle("タスクの編集")
        .navigationBarItems(trailing:
                                Button(action: {
                                    save()
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Text("閉じる")
                                        .foregroundColor(.blue)
                                })
        )
        .foregroundColor(.black)
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("タスクの削除"), message: Text("このタスクを削除します。よろしいですか？"), buttons: [
                            .destructive(Text("削除")) {
                                self.delete()
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            .cancel(Text("キャンセル"))
                ])
        }
    }
}

struct EditTask_Previews: PreviewProvider {
    static var container = PersistenceController.preview.container
    static var context = container.viewContext
    
    static var previews: some View {
        let newTodo = TodoEntity(context: context)
        newTodo.task = "tasktask"
        return NavigationView {
            EditTask(todo: newTodo)
                .environment(\.managedObjectContext, context)
        }
    }
}
