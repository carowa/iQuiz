//  August Carow
//  data.swift
//  iQuiz
//
//  Created by August Carow on 2/14/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import Foundation

struct JSONQuiz : Decodable {
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
}

class quizRepo {
    static let shared = quizRepo.self
    
    private var quizzes : JSONQuiz = JSONQuiz(data: [])
    
    private var score : Int = 0
    
    //get by category
    func getQuestions(category: String) -> [Question] {
        for quiz in quizzes.data {
            if quiz.title == category {
                return quiz.questions
            }
        }
        return []
    }
    
    func getQuizzes() -> [Quiz] {
        return quizzes.data
    }
    
    //add one point to the score
    func addToScore() {
        score = score + 1
    }
    
    //return the current score
    func getScore() -> Int {
        return score
    }
    
    //return the number of quizzes
    func count() -> Int {
        return quizzes.data.count
    }
    
    //edit the question given the category, question, and guess
//    func editQuestions(category : String, questionIndex : Int, guess: Int) {
//        var array = self.getQuestions(category: category)
//        for i in 0...array.count {
//            if i == questionIndex {
//                array[i].guess = guess
//            }
//        }
//    }
    
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
                    let array = try JSONDecoder().decode([Quiz].self, from: data)
                      self.quizzes.data = array
                }  catch let err {
                    print("Error: couldn't transform into quiz struct", err)
                    return
                }

            }.resume()
    }
}
