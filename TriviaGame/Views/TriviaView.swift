//
//  TriviaView.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var manager:TriviaManager
    var body: some View {
        if manager.reachedEnd{
            VStack(spacing:20){
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulations, you complated the game! 🥳 ")
                    .padding(.horizontal)
                
                Text("You scored \(manager.score) out of \(manager.length)")
                
                Button {
                    Task.init {
                        await manager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(.accent)
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.bg)
        }else{
            QuestionView()
                .environmentObject(manager)
        }
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
