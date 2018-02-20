//
//  AnswerVC.swift
//  iQuiz
//
//  Created by August Carow on 2/15/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class AnswerVC: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    
    let repoRef : quizRepo = quizRepo()
    var category : String = ""
    var guessInt : Int = -1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func toEndScreen(_ sender: Any) {
        performSegue(withIdentifier: "toEnd", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = repoRef.getQuestions(category: category)[0]
        let answerIndex = Int(question.answer)
        
        answerText.text = "The answer was \(question.answers[answerIndex!])"
        
        print("guess: \(guessInt)")
        print ("correct answer: \(question.answer)")
        
        if String(guessInt) != question.answer {
            successMessage.text = "Uh oh, your guess was incorrect ):"
        } else {
            successMessage.text = "Yay! You're right!"
            repoRef.addToScore()
        }
     }

}
