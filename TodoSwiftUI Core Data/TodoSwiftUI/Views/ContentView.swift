//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoCD.name, ascending: false)])
    private var todosCD: FetchedResults<TodoCD>
    
    @State private var showAddTodoView = false
    
    private func deleteTodo(offsets: IndexSet) {
        for index in offsets {
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
    }
    
    private func updateTodo(todo: FetchedResults<TodoCD>.Element) {
        todo.name = "❌"
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todosCD, id: \.self) { todo in
                    NavigationLink(destination: TodoDetails(todo: todo)) {
                        TodoRow(todo: todo)
                    }
                    .onLongPressGesture(perform: {
                        updateTodo(todo: todo)
                    })
                }
                .onDelete(perform: { indexSet in
                    deleteTodo(offsets: indexSet)
                })
            }
            .navigationTitle("Todos")
            .navigationBarItems(
                leading: AddTodoButton(showAddTodoView: $showAddTodoView),
                trailing: EditButton()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
