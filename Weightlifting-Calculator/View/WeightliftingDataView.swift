//
//  WeightliftingDataView.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 16/07/24.
//

import SwiftUI
import  Foundation

struct WeightliftingDataView: View {
    var rm: Double
    @Environment(\.colorScheme) var colorScheme
    @State var currentExercise: ExerciseType
    var body: some View {
        
        ScrollView{
            ZStack{
                Color(.elevated).ignoresSafeArea()

            VStack {
                Spacer()
                
                //RM Value
                VStack(alignment: .center) {
                    Text("1RM VALUE")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(UIColor.secondaryLabel))
                        .opacity(0.7)
                    
                    HStack(alignment: .lastTextBaseline, spacing: 0.3) {
                        Text("\(rm, specifier: "%.2f")")
                            .font(.system(size: 80))
                        Text("kg")
                            .font(.system(size: 20))
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(Color.blue)
                    
                    Text(currentExercise == .benchpress ? "BENCH PRESS" : "DEADLIFT")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(UIColor.secondaryLabel))
                    
                }.padding(.bottom,35)
                
                Spacer()
                
                //Training Weight Card
                VStack(alignment: .leading) {
                    Label("TRAINING WEIGHT", systemImage: "scalemass")
                        .foregroundStyle(Color(UIColor.secondaryLabel))
                    
                    VStack {
                        TrainingWeightRow(percentage: 70, TWReps: 12, TWrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        TrainingWeightRow(percentage: 80, TWReps: 8, TWrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        TrainingWeightRow(percentage: 90, TWReps: 4, TWrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        TrainingWeightRow(percentage: 95, TWReps: 2, TWrm: rm)
                        
                        
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
                        ProgressiveOverloadRow(percentage: 2.5, POrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        
                        ProgressiveOverloadRow(percentage: 5, POrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        ProgressiveOverloadRow(percentage: 7.5, POrm: rm)
                        
                        Divider().overlay(colorScheme == .light ? Color.black : Color.white )
                        
                        ProgressiveOverloadRow(percentage: 10, POrm: rm)
                    }
                    .padding(.vertical)
                }
                .padding()
                .background(Color(UIColor.systemFill))
                .clipShape(RoundedRectangle(cornerRadius: 18))
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Weightlifting Data")
        }
            
        }
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
    
    var percentage: Double
    @StateObject private var TrainingViewModel : TrainingDataViewModel = TrainingDataViewModel()
    var POrm : Double
    var body: some View {
        HStack {
            HStack {
                Text("+ \((percentage), format: .number)")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                Text("%")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            HStack {
                Text("\((TrainingViewModel.getOverloadWeight(percentage: percentage, rm: POrm)), format: .number)")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                Text("kg")
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
    var percentage : Int
    var TWReps : Int
    @StateObject private var TrainingViewModel : TrainingDataViewModel = TrainingDataViewModel()
    var TWrm : Double
    var body: some View {
        HStack {
            TrainingWeightData(unitValue: percentage, unitName: "%")
            Spacer()
            TrainingWeightData(unitValue: TWReps, unitName: "reps")
            Spacer()
            TrainingWeightData(unitValue: Int(TrainingViewModel.getWeight(percentage: percentage, rm: TWrm)), unitName: "Kg")
        }
        .padding(.horizontal, 30)
    }
}
