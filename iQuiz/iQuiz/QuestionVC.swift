//  August Carow
//  QuestionVC.swift
//  iQuiz
//
//  Created by August Carow on 2/13/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var optionsTable: UITableView!
    @IBOutlet weak var questionText: UILabel!
    
    var score : Int = 0
    var currentQuestion = 0
    var category : String = ""
    
    let quizzes : quizRepo = quizRepo()
    var questions : [Question]? = nil
    var guessedInt : Int = -1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let option = questions![0].options[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = option
        return cell
    }
    
    @IBAction func nextSegue(_ sender: Any) {
        performSegue(withIdentifier: "toAnswer", sender: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //update answer in quizRepo
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        quizzes.editQuestions(category: category, questionIndex: 0, guess: indexPath.row)
        print("cell clicked on: \(indexPath.row)")
        guessedInt = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AnswerVC {
            destination.category = category
            destination.guessInt = guessedInt
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.optionsTable.dataSource = self
        self.optionsTable.delegate = self
        
        questions = quizzes.getQuestions(category: category)
        //print(questions)
        //questionNumber.text = "Q\(currentQuestion)"
        questionText.text = questions![0].questionText
    }

}
