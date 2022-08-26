//
//  Note.swift
//  NotesApp
//
//  Created by Ryan Michael Kane on 8/23/22.
//

import Foundation

struct Note: Identifiable {
    let id: String
    let title: String
    let date: Date
    let body: String
}
