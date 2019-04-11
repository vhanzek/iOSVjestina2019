//
//  Question.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import Foundation

class Question {
    
    let id: Int
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    init?(json: Any) {
        if let jsonDict = json as? [String: Any],
            let id = jsonDict["id"] as? Int,
            let question = jsonDict["question"] as? String,
            let answers = jsonDict["answers"] as? [String],
            let correctAnswer = jsonDict["correct_answer"] as? Int {
            
            self.id = id
            self.question = question
            self.answers = answers
            self.correctAnswer = correctAnswer
        } else {
            return nil
        }
    }
    
}
