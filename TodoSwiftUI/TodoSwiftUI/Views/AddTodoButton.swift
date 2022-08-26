//
//  AddTodoButton.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct AddTodoButton: View {
    @Binding var showAddTodoView: Bool
    @Binding var todos: [Todo]
    
    var body: some View {
        Button(action: {
            self.showAddTodoView.toggle()
        }) {
            Text("Add")
        }.sheet(isPresented: $showAddTodoView) {
            AddTodo(showAddTodoView: self.$showAddTodoView, todos: self.$todos)
        }
    }
}

struct AddTodoButton_Previews: PreviewProvider {
    static var todos: [Todo] = [Todo.default]
    
    static var previews: some View {
        AddTodoButton(showAddTodoView: .constant(false), todos: .constant(todos))
        
        AddTodoButton(showAddTodoView: .constant(true), todos: .constant(todos))
    }
}
