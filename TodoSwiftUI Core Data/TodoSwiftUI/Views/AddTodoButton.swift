//
//  AddTodoButton.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct AddTodoButton: View {
    @Binding var showAddTodoView: Bool
    
    var body: some View {
        Button(action: {
            self.showAddTodoView.toggle()
        }) {
            Text("Add")
        }.sheet(isPresented: $showAddTodoView) {
            AddTodo(showAddTodoView: self.$showAddTodoView)
        }
    }
}

struct AddTodoButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoButton(showAddTodoView: .constant(false))
        
        AddTodoButton(showAddTodoView: .constant(true))
    }
}
