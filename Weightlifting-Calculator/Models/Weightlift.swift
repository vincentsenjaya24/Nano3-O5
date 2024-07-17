//
//  Weightlift.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 16/07/24.
//

import Foundation

enum Exercise: Codable {
    case BenchPress
    case Deadlift
}

struct TrainingData {
    var percentage: Int
    var reps: Int
    var weight: Double
}

struct ProgressOverload {
    var percentage: Double
    var weight: Double
}

struct Weightlift {
    var rm: Double
    var exercise: Exercise
    var TrainingPlan: [TrainingData]
    var ProgressOverloadPlan: [ProgressOverload]
}
