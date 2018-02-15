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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let option = questions![0].options[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! TableViewCell
        
        cell.cellText?.text = option
//        cell.text = "party time"
//        cell.cellTitle.text = "party time"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? QuestionVC {
//            destination.category = quizTypes[selectedIndex]
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
