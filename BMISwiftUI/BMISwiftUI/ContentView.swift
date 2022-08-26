//
//  ContentView.swift
//  BMISwiftUI
//
//  Created by Ryan Michael Kane on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0.0
    @State private var classification: String?
    
    static func parseDouble(_ str: String) -> Double {
        return Double(str) ?? 0.0
    }
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
            TextField("Enter weight (kilograms)", text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.primary)
            TextField("Enter height (meters)", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.primary)
            
            Button {
                let weight = ContentView.parseDouble(self.weightText)
                let height = ContentView.parseDouble(self.heightText)
                self.bmi = weight / pow(height, 2)
        
                if self.bmi < 18.5 {
                    self.classification = "Underweight"
                } else if self.bmi < 24.9 {
                    self.classification = "Healthy Weight"
                } else if self.bmi < 29.9 {
                    self.classification = "Overweight"
                } else {
                    self.classification = "Obese"
                }
            } label: {
                Text("Caculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
            }
            
            Text("BMI: \(self.bmi, specifier: "%.1f"), \(self.classification ?? "Unknown")")
                .font(.title)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ZStack {
                Color(.black)
                ContentView()
                    .environment(\.colorScheme, .dark)
            }
        }
        
        ContentView()
    }
}
