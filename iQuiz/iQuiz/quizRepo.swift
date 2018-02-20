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

struct jsonQuiz : Decodable {
    var data : [Quiz]
}

struct Quiz: Decodable {
    var title : String = ""
    var desc : String = ""
    var questions : [Question] = []
}

struct Question: Decodable {
    var text : String = ""
    var answer : String = ""
    var answers : [String] = [""]
    //var guess : Int? = -1
}

class quizRepo {
    static let shared = quizRepo.self
    private var score : Int = 0

    //note: took out guess field to make it compile
    private var questionsDict : [String:[Question]] =
        ["Science" : [Question(text: "What is the process that plants go through to synthesize food?", answer: "2", answers: ["entropy", "milling", "photosynthesis", "shopping"])],
         "Math" : [Question(text: "What is 2 + 2?", answer: "0", answers: ["4", "3", "2", "1"])],
         "Marvel" : [Question(text: "What is Superman's alias?", answer: "1", answers: ["Joe Jonas", "Clark Kent", "Billy Bob", "Clark Kint"])]
    ]
    
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
    
    //request and parse JSON
    func getjSON() {
        let jsonUrlString : String = "https://tednewardsandbox.site44.com/questions.json"
        
        guard let url:URL = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, err) in
            guard let data = data else {
                print("Error: no data")
                return
            }
                do {
                    //print(String(data: data, encoding: String.Encoding.utf8))
                    //print(data)
                    var array = try JSONDecoder().decode([Quiz].self, from: data)
//                      self.jsonQuiz.append(quiz)
//                    for quiz in array.data {
//                        array.data.append(quiz)
//                    }
                    
                }  catch let err {
                    print("Error: couldn'td transform into quiz struct", err)
                    return
                }

            }.resume()
    }
}
