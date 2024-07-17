//
//  ExFormView.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 17/07/24.
//

import SwiftUI

enum CalculatorType: Codable, Hashable {
    case rm
    case weight
}

struct ExFormView: View {
    @State var rm: Double?
    @State var weight: Double?
    @State var reps: Int?
    
    @State var selection: CalculatorType = .rm
    
    @StateObject var contentViewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 20){
                Spacer()
                HStack{
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
                    
                    if selection == .rm {
                        VStack(spacing: 20) {
                            HStack{
                          
                                TextField("Enter weight (kg)", value: $weight, format: .number)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                            TextField("Enter reps", value: $reps, format: .number)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            
                            Button(action: {
                                rm = contentViewModel.getRM(weight: weight!, reps: reps!)
                                print(rm ?? 0.0)
                            }, label: {
                                Text("Calculate")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            })
                            .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .padding(.top)
                    } else {
                        VStack(spacing: 20) {
                            HStack{
                          
                                TextField("Enter RM", value: $weight, format: .number)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                            
                            Button(action: {
                                print(rm ?? 0.0)
                            }, label: {
                                Text("Calculate")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            })
                            .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .padding(.top)
                    }
                }
            }
        }
    }
}

#Preview {
    ExFormView()
}
