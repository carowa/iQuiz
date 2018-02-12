//  August Carow
//  ViewController.swift
//  iQuiz
//
//  Created by August Carow on 2/12/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource  {
    
    @IBOutlet weak var table: UITableView!
    
    let quizTypes : [String] = ["Marvel", "Science", "Mathemathics"]
    let descriptions : [String] = ["Superheroes in comics and movies from the Marvel franchise", "Physics, Chemistry, and the Natural World", "Calculus, Trigonometry, and Algebra"]
    let images : [UIImage] = [UIImage(named: "Marvel")!, UIImage(named: "Science")!, UIImage(named: "Math")!]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

