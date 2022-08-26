//
//  AddTodo.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct AddTodo: View {
    @Environment(\.managedObjectContext) private var viewContext

    @Binding var showAddTodoView: Bool
    
    @State private var name: String = ""
    @State private var selectedCategory = 0
    var categoryTypes = ["family", "personal", "work"]
    
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
                if (!name.isEmpty) {
                    let newTodoCD = TodoCD(context: viewContext)
                    newTodoCD.name = name
                    newTodoCD.category = categoryTypes[selectedCategory]
                    
                    do {
                        try viewContext.save()
                    } catch {
                        let error = error as NSError
                        fatalError("unresolved error: \(error)")
                    }
                }
            }
        }
        .padding()
    }
}

struct AddTodo_Previews: PreviewProvider {
    static var previews: some View {
        AddTodo(showAddTodoView: .constant(false))
    }
}
