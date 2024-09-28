//
//  AnswerRow.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct AnswerRow: View {
    @State private var isSelected = false
    var answer: Answer
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if isSelected{
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green:.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .foregroundColor(isSelected ? .accent: .gray)
        .background(.white)
        .cornerRadius(10)
        .shadow(color:isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5,x: 0.5,y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}

#Preview {
    AnswerRow(answer: Answer(text: "jfgdfsdfghyjui", isCorrect: false))
}
