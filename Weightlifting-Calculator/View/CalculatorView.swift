//
//  CalculatorView.swift
//  Weightlifting-Calculator
//
//  Created by Valentinus Kenji on 17/07/24.
//
import SwiftUI

struct CalculatorView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    @State private var selection = 0
    @State private var showResultView = false
    @State private var rm : Double?
    @State var currentRM = ""
    @State var currentWeight = ""
    @State var currentReps = ""
    @State var currentExercise = ""
    @State private var selectedExercise: String?

    var body: some View {
        NavigationView {
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
                                TextField("Weight (Kg)", value: $contentViewModel, format: .number)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }

                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Reps", value: $contentViewModel.reps, format: .number)
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
                                ExerciseButton(label: "Bench Press", isSelected: selectedExercise == "Bench Press") {
                                    selectedExercise = "Bench Press"
                                    currentExercise = "Bench Press"
                                }
                                ExerciseButton(label: "Deadlift", isSelected: selectedExercise == "Deadlift") {
                                    selectedExercise = "Deadlift"
                                    currentExercise = "Deadlift"
                                }
                                Spacer()
                            }
                            .padding(.leading)

                            Spacer()

                            Button(action: {
                                contentViewModel.getRM()
                                showResultView = true
                            }) {
                                Text("Calculate")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            .background(
                                NavigationLink(destination: WeightliftingDataView().environmentObject(contentViewModel), isActive: $showResultView) {
                                    EmptyView()
                                }
                            )

                        }
                        .padding(.top)
                    } else {
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("RM", value: $contentViewModel.currentRM, format: .number)
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
                                ExerciseButton(label: "Bench Press", isSelected: selectedExercise == "Bench Press") {
                                    selectedExercise = "Bench Press"
                                    currentExercise = "Bench Press"
                                }
                                ExerciseButton(label: "Deadlift", isSelected: selectedExercise == "Deadlift") {
                                    selectedExercise = "Deadlift"
                                    currentExercise = "Deadlift"
                                }
                                Spacer()
                            }
                            .padding(.leading)

                            Spacer()

                            Button(action: {
                                showResultView = true
                            }) {
                                Text("Set 1RM")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            .background(
                                NavigationLink(destination: WeightliftingDataView().environmentObject(contentViewModel), isActive: $showResultView) {
                                    EmptyView()
                                }
                            )
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

