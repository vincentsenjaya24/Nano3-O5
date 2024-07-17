//
//  TrainingDataViewModel.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

class TrainingDataViewModel: ObservableObject, WeightCalculator {
    
    func getWeight(percentage: Int, rm: Double) -> Double {
        return rm * (Double(percentage) / 100.0)
    }
    
    func getOverloadWeight(percentage: Double, rm: Double) -> Double {
        return rm + rm * (percentage / 100)
    }
    
}
