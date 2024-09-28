//
//  QuestionView.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var manager:TriviaManager
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Trivate Game")
                    .lilacTitle()
                Spacer()
                Text("\(manager.index + 1) out of \(manager.length)")
                    .fontWeight(.heavy)
                    .foregroundColor(.accent)
            }
            
            ProgressBar(progress: manager.progress)
            
            VStack(alignment: .leading,spacing: 20) {
                Text(manager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(manager.answerChoise,id: \.id){ answer in
                    AnswerRow(answer: answer)
                        .environmentObject(manager)
                }
            }
            
            
            Button {
                manager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next",background: manager.answerSelected ? .accent : .gray.opacity(0.35))
            }
            .disabled(!manager.answerSelected)
           
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.bg)
//        .navigationBarHidden(true)
        
    }
}

#Preview {
    QuestionView()
        .environmentObject(TriviaManager())
}
