//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/18/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    
    
    
    var quiz : Quiz!
    var selectedAnswer = -1
    var score = 0
    var questionNumber = 0
    var currentQuestion: Question!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if (selectedAnswer >= 0) {
            performSegue(withIdentifier: "goToAnswerSegue", sender: self)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        currentQuestion = quiz.questions[questionNumber]
        questionLabel.text = currentQuestion.questionText
        button0.setTitle(currentQuestion.answers[0], for: .normal)
        button1.setTitle(currentQuestion.answers[1], for: .normal)
        button2.setTitle(currentQuestion.answers[2], for: .normal)
        button3.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        selectedAnswer = sender.tag
        if selectedAnswer >= 0 {
            button0.backgroundColor = UIColor.white
            button1.backgroundColor = UIColor.white
            button2.backgroundColor = UIColor.white
            button3.backgroundColor = UIColor.white
            sender.backgroundColor = UIColor.gray
            selectedAnswer = sender.tag
        }
    }
    
    // navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAnswerSegue" && selectedAnswer >= 0 {
            let answerController = segue.destination as! AnswerViewController
            answerController.correct = selectedAnswer == currentQuestion.correctAnswerIdx
            answerController.questionIdx = questionNumber
            answerController.quiz = self.quiz
            if answerController.correct {
                answerController.score = self.score + 1
            } else {
                answerController.score = self.score
            }
            answerController.questions = self.quiz.questions
        } 
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goToAnswerSegue" {
            return selectedAnswer >= 0
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextQuestion))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goBack() {
        performSegue(withIdentifier: "goBackToQuizzesSegue", sender: self)
    }
    
    @objc func nextQuestion() {
        performSegue(withIdentifier: "goToAnswerSegue", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
