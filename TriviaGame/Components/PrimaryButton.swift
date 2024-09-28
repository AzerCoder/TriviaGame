//
//  PrimaryButton.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text:String
    var background:Color = .accentColor
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
