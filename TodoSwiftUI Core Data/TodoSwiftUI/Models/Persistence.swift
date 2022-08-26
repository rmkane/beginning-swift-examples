//
//  Persistence.swift
//  TodoSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        })
    }
    
    static func mockTodoFunc() -> TodoCD {
        let instance = TodoCD(context: PersistenceController.shared.container.viewContext)
        instance.name = "Task"
        instance.category = "work"
        return instance
    }
    
    static let mockTodo: TodoCD = {
        let foo = TodoCD(context: PersistenceController.shared.container.viewContext)
        foo.name = "Task"
        foo.category = "work"
        return foo
    }()
}
