//
//  Weightlift.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 16/07/24.
//

import Foundation

struct TrainingData: Identifiable {
    var id: UUID = UUID()
    
    var percentage: Int
    var reps: Int
    var weight: Double
}

struct ProgressOverload: Identifiable {
    var id: UUID = UUID()
    
    var percentage: Double
    var weight: Double
}

struct Weightlift {
    var rm: Double
    var exercise: ExerciseType
    var TrainingPlan: [TrainingData]
    var ProgressOverloadPlan: [ProgressOverload]
}
