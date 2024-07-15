//
//  Calculator.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 09/07/24.
//

import Foundation

protocol WeightliftingCalculatorProtocol {
    func calculateRM(weight: Double, reps: Int) -> Double
}

final class RMCalculator: WeightliftingCalculatorProtocol {
    func calculateRM(weight: Double, reps: Int) -> Double {
        return weight * (1 + 0.0333 * Double(reps))
    }
}
