import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var reps: String = ""
    @State private var oneRepMax: String = ""
    @State private var selection = 0

    var body: some View {
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
                
                if selection == 0 {
                    VStack(spacing: 20) {
                        HStack{
                      
                            TextField("Enter weight (kg)", text: $weight)
                                .keyboardType(.decimalPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                        TextField("Enter reps", text: $reps)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        
                        Button(action: calculateOneRepMax) {
                            Text("Calculate 1RM")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        if !oneRepMax.isEmpty {
                            Text("Estimated 1RM: \(oneRepMax) kg")
                                .font(.headline)
                                .padding()
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                } else {
                    Text("Option 2 Selected")
                        .font(.headline)
                        .padding()
                }
            }
        }
    }

    private func calculateOneRepMax() {
        guard let weight = Double(weight), let reps = Int(reps) else {
            oneRepMax = "Invalid input"
            return
        }

        let oneRepMaxValue = OneRepMaxCalculator.calculateOneRepMax(weight: weight, reps: reps)
        oneRepMax = String(format: "%.2f", oneRepMaxValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

