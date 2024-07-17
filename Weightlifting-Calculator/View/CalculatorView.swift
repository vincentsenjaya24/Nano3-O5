//
//  CalculatorView.swift
//  Weightlifting-Calculator
//
//  Created by Valentinus Kenji on 17/07/24.
//
import SwiftUI

enum ExerciseType: Codable, Hashable {
    case benchpress
    case deadlift
}

struct CalculatorView: View {
    @StateObject private var contentViewModel: ContentViewModel = ContentViewModel()
    @State private var selection = 0
    @State private var showResultView = false

    @State var currentRM: Double = 0.0
    @State var currentWeight: Double = 0.0
    @State var currentReps: Int = 0
    @State var currentExercise: ExerciseType = .benchpress
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                HStack {
                    Text("Weightlifting Calculator")
                        .font(.title)
                }
                .padding(.leading)

                VStack(spacing: 20) {
                    Picker(selection: $selection, label: Text("Picker")) {
                        Text("Weight - Rep").tag(0)
                        Text("1RM").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    if selection == 0 {
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Weight (Kg)", value: $currentWeight, formatter: numberFormatter)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }

                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Reps", value: $currentReps, formatter: numberFormatter)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }

                            HStack {
                                Text("EXERCISE")
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Spacer()
                            }
                            HStack(spacing: 10) {
                                ExerciseButton(label: "Bench Press", isSelected: currentExercise == .benchpress) {
                                    currentExercise = .benchpress
                                }
                                ExerciseButton(label: "Deadlift", isSelected: currentExercise == .deadlift) {
                                    currentExercise = .deadlift
                                }
                                Spacer()
                            }
                            .padding(.leading)

                            Spacer()
                            
                            NavigationLink(destination: WeightliftingDataView(rm: contentViewModel.getRM(weight: currentWeight, reps: currentReps)), label: {
                                Text("Calculate")
                            })
                            .disabled(currentWeight == 0.0 || currentReps == 0)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(currentWeight == 0.0 || currentReps == 0 ?  Color(UIColor.tertiaryLabel) : Color.white)
                            .background(currentWeight == 0.0 || currentReps == 0 ?  Color(UIColor.tertiarySystemFill) : Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.top)
                    } else {
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("RM", value: $currentRM, format: .number)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                            HStack {
                                Text("EXERCISE")
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Spacer()
                            }
                            HStack(spacing: 10) {
                                ExerciseButton(label: "Bench Press", isSelected: currentExercise == .benchpress) {
                                    currentExercise = .benchpress
                                }
                                ExerciseButton(label: "Deadlift", isSelected: currentExercise == .deadlift) {
                                    currentExercise = .deadlift
                                }
                                Spacer()
                            }
                            .padding(.leading)

                            Spacer()

                            NavigationLink(destination: WeightliftingDataView(rm: currentRM ?? 0.0), label: {
                                
                                Button(action: {
                                    currentRM = contentViewModel.getRM(weight: currentWeight ?? 0.0, reps: currentReps ?? 0)
                                }) {
                                    Text("Calculate")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            })
                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ExerciseButton: View {
    var label: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .padding()
                .background(isSelected ? Color(.systemBlue) : Color(.systemGray6))
                .foregroundColor(isSelected ? .white : .blue)
                .cornerRadius(40)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

