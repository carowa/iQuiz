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
    
    let quizzes : quizRepo = quizRepo()
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
        
        let ref = quizzes.getQuestions(category: category)
        let answerIndex = ref[0].correctAnswer
        answerText.text = "The answer was \(ref[0].options[answerIndex])"
        print("guess: \(guessInt)")
        print ("correc answer: \(ref[0].correctAnswer)")
        if guessInt != ref[0].correctAnswer {
            successMessage.text = "You're wrong ):"
        } else {
            successMessage.text = "You're correct!"
            quizzes.addToScore()
        }
     }

}
