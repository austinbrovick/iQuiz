//
//  Quiz.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/18/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    let quizTitle : String
    let quizDescription : String
    let quizImage : UIImage
    var questions : [Question]
    
    
    init(quizTitle : String, quizDescription : String, quizImage: UIImage) {
        self.quizTitle = quizTitle
        self.quizDescription = quizDescription
        self.quizImage = quizImage
        self.questions = [Question]()
    }
    
    func addQuestion(_ q: Question) {
        questions.append(q)
    }
}

