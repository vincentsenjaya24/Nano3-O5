//
//  OneRepMaxCalculator.swift
//  Weightlifting-Calculator
//
//  Created by Valentinus Kenji on 14/07/24.
//

import Foundation



struct OneRepMaxCalculator {
    static func calculateOneRepMax(weight: Double, reps: Int) -> Double {
        return weight * (1 + 0.0333 * Double(reps))
    }
}
