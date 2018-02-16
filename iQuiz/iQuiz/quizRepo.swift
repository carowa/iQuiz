//  August Carow
//  data.swift
//  iQuiz
//
//  Created by August Carow on 2/14/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import Foundation

struct Question {
    var questionText : String = ""
    var options : [String] = [""]
    var correctAnswer : Int = 0
    var guess : Int = -1
}

class quizRepo {
    static let shared = quizRepo.self
    
    //get by category
    func getQuestions(category: String) -> [Question] {
        return questionsDict[category]!
    }
    
    func addToScore() {
        score + 1
    }
    
    func getScore() -> Int {
        return score
    }
    
    func editQuestions(category : String, questionIndex : Int, guess : Int) {
        print("in edit question before update, value of guess =\(questionsDict[category]![questionIndex].guess)")
        questionsDict[category]![questionIndex].guess = guess
                print("in edit question after update, value of guess =\(questionsDict[category]![questionIndex].guess)")
    }
    
    private var score : Int = 0
    
    private var questionsDict : [String:[Question]] =
        ["Science" : [Question(questionText: "What is the process that plants go through to synthesize food?", options: ["entropy", "milling", "photosynthesis", "shopping"], correctAnswer: 2, guess: -1)],
         "Math" : [Question(questionText: "What is 2 + 2?", options: ["4", "3", "2", "1"], correctAnswer: 0, guess: -1)],
         "Marvel" : [Question(questionText: "What is Superman's alias?", options: ["Joe Jonas", "Clark Kent", "Billy Bob", "Clark Kint"], correctAnswer: 1, guess: -1)]
        ]
}
