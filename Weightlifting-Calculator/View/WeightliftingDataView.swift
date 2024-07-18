//
//  WeightliftingDataView.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 16/07/24.
//

import SwiftUI

struct WeightliftingDataView: View {    
    @StateObject var dataViewModel: TrainingDataViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            //RM Value
            VStack(alignment: .center) {
                Text("1RM VALUE")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                    .opacity(0.7)
                    .background(Color(UIColor.tertiarySystemFill))
                    
                HStack(alignment: .lastTextBaseline, spacing: 0.3) {
                    Text("\(dataViewModel.trainingData?.rm ?? 0.0, format: .number)")
                        .font(.system(size: 80))
                    Text("kg")
                        .font(.system(size: 20))
                }
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
                
                Text("\(dataViewModel.trainingData?.exercise ?? .benchpress)")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                
            }
            
            Spacer()
            
            //Training Weight Card
            VStack(alignment: .leading) {
                Label("TRAINING WEIGHT", systemImage: "scalemass")
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                
                VStack {
                    ForEach(dataViewModel.trainingData!.TrainingPlan) { data in
                        TrainingWeightRow(data: data)
                        
                        Divider()
                    }
//                    TrainingWeightRow()
//
//                    Divider()
//                    
//                    TrainingWeightRow()
//
//                    Divider()
//                    
//                    TrainingWeightRow()
                }
                .padding(.vertical)
            }
            .padding()
            .background(Color(UIColor.systemFill))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            VStack(alignment: .leading) {
                Label("PROGRESSIVE OVERLOAD", systemImage: "chart.line.uptrend.xyaxis")
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                
                VStack {
                    ProgressiveOverloadRow()
                    
                    Divider()
                    
                    ProgressiveOverloadRow()

                    Divider()
                    
                    ProgressiveOverloadRow()
                }
                .padding(.vertical)
            }
            .padding()
            .background(Color(UIColor.systemFill))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            Spacer()
        }
        .navigationTitle("Weightlifting Data")
        .padding(.horizontal)
        
    }
}

//#Preview {
//    WeightliftingDataView()
//}

struct ProgressiveOverloadData: View {
    var quantity: Double
    var unit: String
    
    var body: some View {
        HStack {
            Text("\(quantity, format: .number)")
                .font(.system(size: 30))
                .fontWeight(.medium)
            
            Text("\(unit)")
                .font(.system(size: 15))
                .fontWeight(.medium)
        }
    }
}


struct ProgressiveOverloadRow: View {
    
    var percentage: Double?
    var weight: Double?
    
    var body: some View {
        HStack {
            HStack {
                Text("+ \(2.5, format: .number)")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                Text("%")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            HStack {
                Text("\(153.75, format: .number)")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                Text("Kg")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct TrainingWeightData: View {
    var unitValue: Int
    var unitName: String
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(unitValue)")
                .font(.system(size: 30))
                .fontWeight(.medium)
            Text(unitName)
                .font(.system(size: 15))
                .fontWeight(.medium)
        }
    }
}

struct TrainingWeightRow: View {
    var data: TrainingData
    
    var body: some View {
        HStack {
            TrainingWeightData(unitValue: data.percentage, unitName: "%")
            Spacer()
            TrainingWeightData(unitValue: data.reps, unitName: "reps")
            Spacer()
            TrainingWeightData(unitValue: Int(data.weight), unitName: "Kg")
        }
        .padding(.horizontal, 30)
    }
}
