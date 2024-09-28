//
//  QuestionView.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Trivate Game")
                    .lilacTitle()
                Spacer()
                Text("1 out of 10")
                    .fontWeight(.heavy)
                    .foregroundColor(.accent)
            }
            
            ProgressBar(progress: 35)
            
            VStack(alignment: .leading,spacing: 20) {
                Text("Jjd")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                AnswerRow(answer: Answer(text: "False", isCorrect: true))
                AnswerRow(answer: Answer(text: "True", isCorrect: false))
            }
            
            PrimaryButton(text: "Next")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.bg)
        .navigationBarHidden(true)
        
    }
}

#Preview {
    QuestionView()
}
