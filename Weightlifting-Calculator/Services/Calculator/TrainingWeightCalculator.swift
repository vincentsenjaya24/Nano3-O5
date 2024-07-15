//
//  TrainingWeightCalculator.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 12/07/24.
//

import Foundation

protocol TrainingWeight {
    func getWeight(percentage: Int) -> Double
}

final class TrainingWeightCalculator: TrainingWeight {
    var rm: Double
    
    init(rm: Double) {
        self.rm = rm
    }
    
    func getWeight(percentage: Int) -> Double {
        return rm * (Double(percentage) / 100.0)
    }
}
