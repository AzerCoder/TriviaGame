//
//  AnswerRow.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var manager:TriviaManager
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
        .foregroundColor(manager.answerSelected ? (isSelected ? .accent: .gray) : .accent)
        .background(.white)
        .cornerRadius(10)
        .shadow(color:isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5,x: 0.5,y: 0.5)
        .onTapGesture {
            if !manager.answerSelected{
                isSelected = true
                manager.selectedAnswer(answer: answer)
            }
        }
    }
}

#Preview {
    AnswerRow(answer: Answer(text: "jfgdfsdfghyjui", isCorrect: false))
        .environmentObject(TriviaManager())
}
