//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import Foundation

class TriviaManager:ObservableObject{
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question:AttributedString = ""
    @Published private(set) var answerChoise: [Answer] = []
    @Published private(set) var progress:CGFloat = 0.00
    @Published private(set) var score = 0
    @Published var category:Int = 0
    
    init(){
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=15&category=\(category)") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        do{
           let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.sync {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                setQuestion()
            }
            
        }catch{
            print("Error fetching trivia \(error)")
        }
    }
    
    func goToNextQuestion(){
        if index + 1 < length{
            index += 1
            setQuestion()
        }else{
            reachedEnd = true
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat((index + 1)/length * 350)
        
        if index < length{
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoise = currentQuestion.answers
        }
    }
    
    func selectedAnswer(answer:Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
}
