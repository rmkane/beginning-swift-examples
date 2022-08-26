//
//  SpamIdentifier.swift
//  SpamClassifier
//
//  Created by Ryan Michael Kane on 8/23/22.
//

import Foundation
import SwiftUI
import CoreML
import NaturalLanguage

class SpamIdentifier: ObservableObject {
    @Published var prediction = ""
    @Published var confidence = 0.0
    
    var model = MLModel()
    var spamPredictor = NLModel()
    
    init() {
        do {
            self.spamPredictor = try NLModel(mlModel: SpamClassifier_1().model)
        } catch {
            print(error)
        }
    }
    
    func predict(_ text: String) {
        self.prediction = spamPredictor.predictedLabel(for: text) ?? ""
        let predictionSet = spamPredictor.predictedLabelHypotheses(for: text, maximumCount: 1)
        self.confidence = predictionSet[prediction] ?? 0.0
    }
}
