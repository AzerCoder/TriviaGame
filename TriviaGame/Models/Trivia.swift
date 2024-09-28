//
//  Trivia.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import Foundation

struct Trivia:Codable{
    var results:[Result]
    
    struct Result:Codable,Identifiable{
        var id: UUID{
            UUID()
        }
        var category:String
        var type:String
        var difficulty:String
        var question:String
        var correctAnswer:String
        var incorrectAnswers:[String]
        
        var formattedQuestion:AttributedString{
            do{
                return try AttributedString(markdown: question)
            }catch{
                print("Error setting formattedQuestion \(error.localizedDescription)")
                return ""
            }
        }
        var answers:[Answer]{
            do{
                let correct = [Answer(text:  try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + incorrects
                return allAnswers.shuffled()
            }catch{
                print("Error setting answer \(error.localizedDescription)")
                return []
            }
        }
    }
}
