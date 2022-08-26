//
//  AddTodo.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct AddTodo: View {
    @Binding var showAddTodoView: Bool
    
    @State private var name: String = ""
    @State private var selectedCategory = 0
    var categoryTypes = ["family", "personal", "work"]
    
    @Binding var todos: [Todo]
    
    var body: some View {
        VStack {
            Text("Add Todo")
                .font(.largeTitle)
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.primary)
                .padding()
            Text("Select Category")
            Picker("", selection: $selectedCategory) {
                ForEach(categoryTypes.indices, id: \.self) { index in
                    Text(categoryTypes[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Done") {
                self.showAddTodoView = false
                todos.append(Todo(name: name, category: categoryTypes[selectedCategory]))
            }
        }
        .padding()
    }
}

struct AddTodo_Previews: PreviewProvider {
    static var todos: [Todo] = [Todo.default]
    
    static var previews: some View {
        AddTodo(showAddTodoView: .constant(false), todos: .constant(todos))
    }
}
