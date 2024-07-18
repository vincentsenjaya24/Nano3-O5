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
    @Environment(\.colorScheme) var colorScheme
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
            ZStack{
                Color(.elevated).ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                HStack {
                    Text("Weightlifting Calculator")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading)
                
                VStack(spacing: 0) {
                    Picker(selection: $selection, label: Text("Picker")) {
                        Text("Weight - Rep").tag(0)
                        Text("1RM").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if selection == 0 {
                        VStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Weight (kg)", value: $currentWeight, formatter: numberFormatter)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .background(Color.textfield)
                                    .clipShape(RoundedCorner(radius: 10, corners:[.topLeft, .topRight]))
                                    .padding(.horizontal)
                            }
                            Divider().frame(width: 330).foregroundStyle(Color(UIColor.separator))
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Reps", value: $currentReps, formatter: numberFormatter)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color.textfield)
                                    .clipShape(RoundedCorner(radius: 10, corners:[.bottomLeft, .bottomRight]))
                                    .padding(.horizontal)
                            }
                            
                            HStack {
                                Text("EXERCISE")
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Spacer()
                            }.padding(.top, 30)
                            HStack(spacing: 10) {
                                ExerciseButton(label: "Bench Press", isSelected: currentExercise == .benchpress) {
                                    currentExercise = .benchpress
                                }
                                ExerciseButton(label: "Deadlift", isSelected: currentExercise == .deadlift) {
                                    currentExercise = .deadlift
                                }
                                Spacer()
                            }
                            .padding(.leading).padding(.top,10)
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: WeightliftingDataView(rm: contentViewModel.getRM(weight: currentWeight, reps: currentReps), currentExercise: currentExercise), label: {
                                Text("Calculate")
                            }).simultaneousGesture(TapGesture().onEnded{
                                currentRM = contentViewModel.getRM(weight: currentWeight ?? 0.0, reps: currentReps ?? 0)
                            })
                            .disabled(currentWeight == 0.0 || currentReps == 0)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(currentWeight == 0.0 || currentReps == 0 ?  Color(UIColor.tertiaryLabel) : Color.white)
                            .background(currentWeight == 0.0 || currentReps == 0 ?  Color(UIColor.tertiarySystemFill) : Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 30)
                        .padding(.top)
                    } else {
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("RM", value: $currentRM, formatter: numberFormatter)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color.textfield)
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
                            
                            NavigationLink(destination: WeightliftingDataView(rm: currentRM, currentExercise: currentExercise), label: {
                                Text("Calculate")
                            }).disabled(currentRM == 0)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(currentRM == 0 ?  Color(UIColor.tertiaryLabel) : Color.white)
                                .background(currentRM == 0 ?  Color(UIColor.tertiarySystemFill) : Color.blue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 30)
                        .padding(.top)
                    }
                    
                }
            }.navigationTitle("")
        }}
    }
    struct ExerciseButton: View {
        var label: String
        var isSelected: Bool
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(label)
                    .padding(10).padding(.horizontal,5)
                    .foregroundColor(isSelected ? Color(.white) : Color(UIColor.label))
                    .background(isSelected ? Color(.systemBlue) : Color(UIColor.tertiarySystemFill))
                    .cornerRadius(40)
                
            }
            

        }
    }
    
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView()
        }
    }
    
    struct RoundedCorner: Shape {
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
}

