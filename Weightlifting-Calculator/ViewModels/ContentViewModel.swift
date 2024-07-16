//
//  ContentViewModel.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 15/07/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    var calculatorService: CalculatorProtocol
    
    @Published var currentRM = 0.0
    @Published var currentWeight = 0.0
    @Published var currentReps = 0
    
    init(calculator: CalculatorProtocol = CalculatorService()) {
        self.calculatorService = calculator
    }
    
    func calculateRM() {
        currentRM = calculatorService.getRM(weight: currentWeight, reps: currentReps)
    }
    
    func setRM(rm: Double) {
        currentRM = rm
    }
}
