//
//  TrainingDataViewModel.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

class TrainingDataViewModel: ObservableObject {
    var rm: Double
    var calculatorService: CalculatorProtocol
    
    init(rm: Double, calculator: CalculatorProtocol = CalculatorService()) {
        self.rm = rm
        self.calculatorService = calculator
    }
    
    func getWeightFromPercentage(percentage: Int) -> Double {
        return calculatorService.getWeight(percentage: percentage, rm: rm)
    }
    
    func getOverloadWeight(percentage: Double) -> Double {
        return rm + rm * (percentage / 100)
    }
    
}
