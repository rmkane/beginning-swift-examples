//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todos: [Todo] = []
    
    @State private var showAddTodoView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    NavigationLink(destination: TodoDetails(todo: todo)) {
                        TodoRow(todo: todo)
                    }
                }
                .onDelete(perform: { indexSet in
                    todos.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("Todos")
            .navigationBarItems(
                leading: AddTodoButton(showAddTodoView: $showAddTodoView, todos: $todos),
                trailing: EditButton()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
