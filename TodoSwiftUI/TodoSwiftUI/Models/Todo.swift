//
//  Todo.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/25/22.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    let name: String?
    let category: String?
    
    static var `default` = Todo(name: "Task", category: "personal")
}
