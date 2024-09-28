//
//  Answer.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import Foundation

struct Answer:Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect:Bool
}
