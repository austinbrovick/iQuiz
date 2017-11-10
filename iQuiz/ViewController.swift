//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/10/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .cancel, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var quizzes = ["Mathematics", "Marvel Super Heros", "Science"]
    var descriptions = ["Mathematics description", "Marvel Super Heros description", "Science description"]
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.quizImage.image = #imageLiteral(resourceName: "diamond")
        cell.titleLabel.text = quizzes[indexPath.row]
        cell.descriptionLabel.text = descriptions[indexPath.row]
        return cell 
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

