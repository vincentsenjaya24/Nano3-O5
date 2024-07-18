//
//  testview.swift
//  Weightlifting-Calculator
//
//  Created by Reza Athallah Rasendriya on 18/07/24.
//

import SwiftUI

struct testview: View {
    var body: some View {
        Text("Hello this is custom label")
            .fontWeight(.bold)
            .font(.largeTitle)
            .foregroundStyle(Color.customLabelColorPrimary)
    }
}

#Preview {
    testview()
}
