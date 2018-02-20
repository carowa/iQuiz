//  August Carow
//  ViewController.swift
//  iQuiz
//
//  Created by August Carow on 2/12/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var table: UITableView!
    
    var selectedIndex : Int = 1
    var repoRef : quizRepo = quizRepo.shared
    var quizzes : [Quiz] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(repoRef.count())
        return repoRef.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        quizzes = repoRef.getQuizzes()
        let quiz = quizzes[index].title
        let image = UIImage(named: quizzes[index].title)
        let description = quizzes[index].desc
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        cell.cellImage?.image = image
        cell.cellTitle?.text = quiz
        cell.cellSubtitle?.text = description
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath[1]
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    @IBAction func settings(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuestionVC {
            destination.category = quizzes[selectedIndex].title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.dataSource = self
        self.table.delegate = self
        
        repoRef.getjSON(tableView: table)
//        quizzes = repoRef.getQuizzes()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

