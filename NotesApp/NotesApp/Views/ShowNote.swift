//
//  ShowNote.swift
//  NotesApp
//
//  Created by Ryan Michael Kane on 8/24/22.
//

import SwiftUI

struct ShowNote: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var id: String = ""
    @State var title: String = ""
    @State var bodyText: String = ""
    
    var repository: NotesRepository
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextEditor(text: $bodyText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .navigationBarTitle("Update Note", displayMode: .inline)
        .navigationBarItems(trailing: Button {
            repository.updateNote(id: id, title: title, date: Date(), body: bodyText)
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "checkmark")
                .font(.headline)
        }.disabled(title.isEmpty))
    }
}

struct ShowNote_Previews: PreviewProvider {
    @ObservedObject
    static var repository:NotesRepository = NotesRepository()
    
    static var previews: some View {
        ShowNote(repository: repository)
    }
}
