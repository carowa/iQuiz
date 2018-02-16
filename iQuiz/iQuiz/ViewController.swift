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
    
    let quizTypes : [String] = ["Marvel", "Science", "Math"]
    let descriptions : [String] = ["Superheroes from Marvel franchise", "Physics, Chemistry, and the Natural World", "Calculus, Trigonometry, and Algebra"]
    let images : [UIImage] = [UIImage(named: "Marvel")!, UIImage(named: "Science")!, UIImage(named: "Math")!]
    var selectedIndex : Int = 1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let quiz = quizTypes[index]
        let image = images[index]
        let description = descriptions[index]
        
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
            destination.category = quizTypes[selectedIndex]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.dataSource = self
        self.table.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

