//  August Carow
//  EndScreenVC.swift
//  iQuiz
//
//  Created by August Carow on 2/15/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class EndScreenVC: UIViewController {

    var repoRef : quizRepo = quizRepo.shared

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var congrats: UILabel!
    
    override func viewDidLoad() {
        scoreText.text = "You got \(repoRef.getScore()) question correct"
        if repoRef.getScore() >= 1 {
            congrats.text = "Wow! Amazing job!"
        }
        
    }
    
}
