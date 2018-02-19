//  August Carow
//  data.swift
//  iQuiz
//
//  Created by August Carow on 2/14/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import Foundation

//struct Question {
//    var questionText : String = ""
//    var options : [String] = [""]
//    var correctAnswer : Int = 0
//    var guess : Int = -1
//}

struct Quiz: Decodable {
    var title : String = ""
    var desc : String = ""
    var questions : [Question] = []
}

struct Question: Decodable {
    var text : String = ""
    var answer : Int = 0
    var answers : [String] = [""]
    var guess : Int = -1
}

class quizRepo {
    static let shared = quizRepo.self
    
    //get by category
    func getQuestions(category: String) -> [Question] {
        return questionsDict[category]!
    }
    
    //add one point to the score
    func addToScore() {
        score = score + 1
    }
    
    //return the current score
    func getScore() -> Int {
        return score
    }
    
    //edit the question given the category, question, and guess
    func editQuestions(category : String, questionIndex : Int, guess : Int) {
        print("in edit question before update, value of guess =\(questionsDict[category]![questionIndex].guess)")
        questionsDict[category]![questionIndex].guess = guess
                print("in edit question after update, value of guess =\(questionsDict[category]![questionIndex].guess)")
    }
    
    private var score : Int = 0
    
    func getjSON() {
        let jsonUrlString : String = "https://tednewardsandbox.site44.com/questions.json"
        
        guard let url:URL = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, err) in
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            
            }.resume()
    }
    
    private var jsonQuiz : [Quiz] = []
    
    private var questionsDict : [String:[Question]] =
        ["Science" : [Question(questionText: "What is the process that plants go through to synthesize food?", options: ["entropy", "milling", "photosynthesis", "shopping"], correctAnswer: 2, guess: -1)],
         "Math" : [Question(questionText: "What is 2 + 2?", options: ["4", "3", "2", "1"], correctAnswer: 0, guess: -1)],
         "Marvel" : [Question(questionText: "What is Superman's alias?", options: ["Joe Jonas", "Clark Kent", "Billy Bob", "Clark Kint"], correctAnswer: 1, guess: -1)]
        ]
}
