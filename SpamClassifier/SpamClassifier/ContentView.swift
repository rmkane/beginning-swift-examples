//
//  ContentView.swift
//  SpamClassifier
//
//  Created by Ryan Michael Kane on 8/23/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var identifier = SpamIdentifier()
    @State private var input = "Enter Message"
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(self.identifier.prediction == "spam" ? "SPAM" : "NOT SPAM")
            Text("Confidence \(self.identifier.confidence)")
            TextEditor(text: $input)
                .font(.title)
                .onChange(of: input) { _ in
                    if input.last == " " {
                        self.identifier.predict(input)
                    }
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
