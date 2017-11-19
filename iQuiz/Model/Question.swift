//
//  Question.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/18/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let correctAnswerIdx: Int
    let answers : [String]
    
    init(questionText: String, correctAnswerIdx: Int, answers: [String]) {
        self.questionText = questionText
        self.correctAnswerIdx = correctAnswerIdx
        self.answers = answers
    }
}



