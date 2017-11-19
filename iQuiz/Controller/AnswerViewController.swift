//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/18/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctOrNotLabel: UILabel!
    
    
    var correct = false
    var questionIdx = -1
    var score = 0
    var questions = [Question]()
    var quiz : Quiz!
    var segue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let currentQuestion = questions[questionIdx]
        questionLabel.text = currentQuestion.questionText
        correctAnswerLabel.text = currentQuestion.answers[currentQuestion.correctAnswerIdx]
        scoreLabel.text = "Score: \(score)/\(questionIdx + 1)"
        
        
        if correct {
            correctOrNotLabel.text = "correct"
        } else {
            correctOrNotLabel.text = "not correct"
        }
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextQuestion))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func nextQuestion() {
        if quiz.questions.count == questionIdx + 1 {
            performSegue(withIdentifier: "doneWithQuizSegue", sender: self)
        } else {
            performSegue(withIdentifier: "nextQuestionSegue", sender: self)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if quiz.questions.count == questionIdx + 1 {
            performSegue(withIdentifier: "doneWithQuizSegue", sender: self)
        } else {
            performSegue(withIdentifier: "nextQuestionSegue", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneWithQuizSegue" {
            let resultsConroller : ResultsViewController = segue.destination as! ResultsViewController
            resultsConroller.score = self.score
            resultsConroller.quiz = self.quiz
        } else {
            let quizController : QuizViewController = segue.destination as! QuizViewController
            quizController.questionNumber = self.questionIdx + 1
            quizController.quiz = self.quiz
            quizController.score = self.score
        }
    }
}
