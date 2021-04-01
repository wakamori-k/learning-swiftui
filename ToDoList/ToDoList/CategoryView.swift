//
//  CategoryView.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/29.
//

import SwiftUI

struct CategoryView: View {
    var category: TodoEntity.Category
    @State var numberOfTasks = 0
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @State var addNewTask = false
    
    private func update() {
        self.numberOfTasks = TodoEntity.count(in: self.viewContext, category: self.category)
    }
    
    var body: some View {
        let gradient = Gradient(colors: [category.color(), category.color().opacity(0.8)])
        let linear = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        
        VStack(alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
                .sheet(isPresented: $showList, onDismiss: update) {
                    TodoList(category: self.category)
                        .environment(\.managedObjectContext, self.viewContext)
                }
            Text(category.toString())
            Text("・\(numberOfTasks)タスク")
            Button(action: {
                self.addNewTask = true
            }) {
                Image(systemName: "plus")
            }.sheet(isPresented: $addNewTask, onDismiss: update) {
                NewTask(category: self.category.rawValue)
                    .environment(\.managedObjectContext, self.viewContext)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150)
        .foregroundColor(.white)
        .background(linear)
        .cornerRadius(20)
        .onTapGesture {
            self.showList = true
        }
        .onAppear {
            self.update()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var container = PersistenceController.preview.container
    static var context = container.viewContext
    
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st, numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd, numberOfTasks: 100)
            CategoryView(category: .NImpUrg_3rd, numberOfTasks: 100)
            CategoryView(category: .NImpNUrg_4th, numberOfTasks: 100)
        }.environment(\.managedObjectContext, context)
    }
}
