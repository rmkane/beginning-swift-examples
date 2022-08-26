//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(.green)
                Button("Increment") {
                    self.count += 1
                }
                .foregroundColor(.purple)
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Count: \(self.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                Text("Your Name, 2022")
            }
            
            ZStack {
                Circle()
                    .fill(.red)
                Button("Reset") {
                    self.count = 0
                }
                .foregroundColor(.cyan)
            }
            .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
            .previewDisplayName("Current")
    }
}
