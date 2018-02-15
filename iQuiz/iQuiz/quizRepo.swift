//  August Carow
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
    static let shared = quizRepo.self
    
    //get by category
    func getQuestions(category: String) -> [Question] {
        return questionsDict[category]!
    }
    
    func editQuestions() {
        //do stuff
    }
    
    private let questionsDict : [String:[Question]] =
        ["Science" : [Question(), Question(), Question(), Question()],
         "Math" : [Question(), Question(), Question(), Question()],
         "Marvel" : [Question(), Question(), Question(), Question()]
        ]

}
