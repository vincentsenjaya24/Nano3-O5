//
//  CalculatorService.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

protocol CalculatorProtocol {
    func getRM(weight: Double, reps: Int) -> Double
    func getWeight(percentage: Int, rm: Double) -> Double
}

class CalculatorService: CalculatorProtocol {
    func getRM(weight: Double, reps: Int) -> Double {
        return weight * (1 + 0.0333 * Double(reps))
    }
    
    func getWeight(percentage: Int, rm: Double) -> Double {
        return rm * (Double(percentage) / 100.0)
    }
}


