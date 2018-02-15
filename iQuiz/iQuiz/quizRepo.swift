//
//  data.swift
//  iQuiz
//
//  Created by August Carow on 2/14/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import Foundation

struct Question {
    let questionText : String = ""
    let options : [String] = [""]
    let correctAnswer : Int = 0
    let guess : String = ""
}


class quizRepo {
    static let shared = quizRepo
    
    //get by category
    func getQuestions() -> [Question] {
        return questionsArray
    }
    
    func editQuestions() {
        //do stuff
    }
    
    private let questionsDict : [String:[Question]] =
        ["Science" : [Question(questionText: "What is the mass of the sun?", options: ["1", "2", "3", "4"], correctAnswer: 3, guess: ""), Question(questionText: "", options: [], correctAnswer: 3, guess: ""), Question(questionText: "", options: [], correctAnswer: 3, guess: ""), Question(questionText: "", options: [], correctAnswer: 3, guess: "")],
         "Math" : [Question(), Question(), Question(), Question()],
         "Marvel" : [Question(), Question(), Question(), Question()]]

}
