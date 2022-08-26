//
//  NewNote.swift
//  NotesApp
//
//  Created by Ryan Michael Kane on 8/24/22.
//

import SwiftUI

struct NewNote: View {
    @State private var title: String = ""
    @State private var bodyText: String = ""
    
    @Binding var isNewNotePresented: Bool
    var repository: NotesRepository
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextEditor(text: $bodyText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationBarTitle("New Note", displayMode: .inline)
            .navigationBarItems(trailing: Button {
                repository.newNote(title: title, date: Date(), body: bodyText)
                isNewNotePresented = false
            } label: {
                Image(systemName: "checkmark")
                    .font(.headline)
            }.disabled(title.isEmpty))
        }
    }
}

struct NewNote_Previews: PreviewProvider {
    @ObservedObject
    static var repository:NotesRepository = NotesRepository()
    
    static var previews: some View {
        NewNote(isNewNotePresented: .constant(true), repository: repository)
    }
}
