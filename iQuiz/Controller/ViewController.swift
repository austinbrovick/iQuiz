//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/10/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var quizzes = [Quiz]()
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .cancel, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let currentQuiz = quizzes[indexPath.row]
        cell.quizImage.image = currentQuiz.quizImage
        cell.titleLabel.text = currentQuiz.quizTitle
        cell.descriptionLabel.text = currentQuiz.quizDescription
        return cell
    }
    
    let quizSegueIdentifier = "goToQuizSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == quizSegueIdentifier, let destination = segue.destination as? QuizViewController, let quizIdx = tableView.indexPathForSelectedRow?.row {
            destination.quiz = quizzes[quizIdx]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        // math quiz
        let mathQuiz = Quiz(quizTitle: "Mathematics", quizDescription: "This is an epic math quiz", quizImage: #imageLiteral(resourceName: "diamond"))
        let a = Question(questionText: "What is 1 + 9?", correctAnswerIdx: 2, answers: ["14", "11", "10", "9"])
        let b = Question(questionText: "What is 81 / 3?", correctAnswerIdx: 0, answers: ["27", "0", "19", "21"])
        mathQuiz.addQuestion(a)
        mathQuiz.addQuestion(b)
        quizzes.append(mathQuiz)
        
        // marvel quiz
        let marvelQuiz = Quiz(quizTitle: "Marvel", quizDescription: "This is a marvel quiz ", quizImage: #imageLiteral(resourceName: "diamond"))
        let c = Question(questionText: "Which superhero is not a marvel superhero?", correctAnswerIdx: 3, answers: ["Thor", "Hulk", "Ironman", "Batman"])
        let d = Question(questionText: "Which superhero has no super power?", correctAnswerIdx: 2, answers: ["Thor", "Hulk", "Ironman", "Spiderman"])
        marvelQuiz.addQuestion(c)
        marvelQuiz.addQuestion(d)
        quizzes.append(marvelQuiz)
        
        let scienceQuiz = Quiz(quizTitle: "Science", quizDescription: "This is a great quiz for people who love science", quizImage: #imageLiteral(resourceName: "diamond"))
        let e = Question(questionText: "Where does rain come from?", correctAnswerIdx: 3, answers: ["California", "The Ground", "Lord Knows", "The Sky"])
        let f = Question(questionText: "What is the derivative of velocity?", correctAnswerIdx: 0, answers: ["acceleration", "velocity", "torque", "speed"])
        scienceQuiz.addQuestion(e)
        scienceQuiz.addQuestion(f)
        quizzes.append(scienceQuiz)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

