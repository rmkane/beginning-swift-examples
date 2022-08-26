//
//  TodoRow.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct TodoRow: View {
    var todo: TodoCD
    
    var body: some View {
        HStack {
            Image(todo.category ?? "").resizable().frame(width: 32, height: 32)
            Text(todo.name ?? "untitled")
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: PersistenceController.mockTodo)
    }
}
