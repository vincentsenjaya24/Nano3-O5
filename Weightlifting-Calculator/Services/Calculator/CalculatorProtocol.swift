//
//  CalculatorService.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

protocol RMCalculator {
    func getRM(weight: Double, reps: Int) -> Double
}

protocol WeightCalculator {
    func getWeight(percentage: Int, rm: Double) -> Double
}


