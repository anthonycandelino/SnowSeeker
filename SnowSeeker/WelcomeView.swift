//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Anthony Candelino on 2024-10-12.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the edge to see resorts")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
