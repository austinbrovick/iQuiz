//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/18/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var quiz : Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLabel.text = "You have finished the quiz"
        scoreLabel.text = "Score: \(score)/\(quiz.questions.count)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
