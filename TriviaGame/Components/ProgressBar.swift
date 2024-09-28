//
//  ProgressBar.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress:CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350,maxHeight: 4)
                .foregroundColor(.gray.opacity(0.3))
                .cornerRadius(10)
            Rectangle()
                .frame(maxWidth: progress,maxHeight: 4)
                .foregroundColor(.accent)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressBar(progress: 40)
}
