//
//  TodoDetails.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct TodoDetails: View {
    var todo: TodoCD
    
    var body: some View {
        VStack {
            Text(todo.name ?? "untitled")
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(todo.category ?? "")
                .resizable()
                .frame(width: 200, height: 200)
            
        }
        .padding()
    }
}

struct TodoDetails_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetails(todo: PersistenceController.mockTodo)
    }
}
