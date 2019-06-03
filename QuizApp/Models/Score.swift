//
//  Score.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 01/06/2019.
//

class Score {
    
    let username: String
    let score: Double
    
    init?(json: Any) {
        if let jsonDict = json as? [String: Any],
            let username = jsonDict["username"] as? String,
            let score = jsonDict["score"] as? String {
            
            self.username = username
            if let score = Double(score) {
                self.score = score
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
