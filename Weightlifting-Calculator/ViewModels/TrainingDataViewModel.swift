//
//  TrainingDataViewModel.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation


//struct TrainingData {
//    var percentage: Int
//    var reps: Int
//    var weight: Double
//}
//
//struct ProgressOverload {
//    var percentage: Double
//    var weight: Double
//}
//
//struct Weightlift {
//    var rm: Double
//    var exercise: Exercise
//    var TrainingPlan: [TrainingData]
//    var ProgressOverloadPlan: [ProgressOverload]
//}

class TrainingDataViewModel: ObservableObject, WeightCalculator {
    
    var rm: Double
    var exercise: ExerciseType
    var trainingData: Weightlift?
    

    init(rm: Double, exercise: ExerciseType) {
        self.rm = rm
        self.exercise = exercise
        
        trainingData = getData()
    }
    
    func getData() -> Weightlift {
        let firstPlan = TrainingData(percentage: 70, reps: 12, weight: getWeight(percentage: 70, rm: rm))
        let secondPlan = TrainingData(percentage: 80, reps: 8, weight: getWeight(percentage: 80, rm: rm))
        let thirdPlan = TrainingData(percentage: 90, reps: 4, weight: getWeight(percentage: 90, rm: rm))
        
        let trainingData = [firstPlan, secondPlan, thirdPlan]
        
        let firstOverload = ProgressOverload(percentage: 2.5, weight: getOverloadWeight(percentage: 2.5, rm: rm))
        let secondOverload = ProgressOverload(percentage: 5.0, weight: getOverloadWeight(percentage: 5.0, rm: rm))
        let thirdOverload = ProgressOverload(percentage: 7.5, weight: getOverloadWeight(percentage: 7.5, rm: rm))
        
        let overloadData = [firstOverload, secondOverload, thirdOverload]
        
        return Weightlift(rm: rm, exercise: exercise, TrainingPlan: trainingData, ProgressOverloadPlan: overloadData)
    }
    
    func getWeight(percentage: Int, rm: Double) -> Double {
        return rm * (Double(percentage) / 100.0)
    }
    
    func getOverloadWeight(percentage: Double, rm: Double) -> Double {
        return rm + rm * (percentage / 100)
    }
    
}
