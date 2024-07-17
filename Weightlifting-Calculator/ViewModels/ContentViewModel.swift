//
//  ContentViewModel.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

class ContentViewModel: ObservableObject, RMCalculator {
    func getRM(weight: Double, reps: Int) -> Double {
        return weight * (1 + 0.0333 * Double(reps))
    }
}
