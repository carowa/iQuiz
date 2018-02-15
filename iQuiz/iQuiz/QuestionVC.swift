//  August Carow
//  QuestionVC.swift
//  iQuiz
//
//  Created by August Carow on 2/13/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    var score : Int = 0
    var currentQuestion = 0
    var category : String = ""
    
    let quizRepo : quizRepo? = nil
    var questions : [Question]? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = quizRepo?.getQuestions()
        
        questionNumber.text = "Q\(currentQuestion)"
        questionText.text = questions![currentQuestion].questionText
        // Do any additional setup after loading the view, typically from a nib.
    }

}
