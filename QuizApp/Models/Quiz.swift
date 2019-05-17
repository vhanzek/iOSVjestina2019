//
//  Quiz.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import UIKit

enum Category: String, CaseIterable {
    
    case sports = "SPORTS"
    case science = "SCIENCE"
    
    var color: UIColor {
        switch self {
        case .sports:
            return UIColor.red
        case .science:
            return UIColor.green
        }
    }
}

class Quiz {
    
    let id: Int
    let title: String
    let description: String?
    let category: Category
    let level: Int
    let imageUrl: String?
    let questions: [Question]
    
    init?(json: Any) {
        if let jsonDict = json as? [String: Any],
            let id = jsonDict["id"] as? Int,
            let title = jsonDict["title"] as? String,
            let category = jsonDict["category"] as? String,
            let level = jsonDict["level"] as? Int,
            let questionsJson = jsonDict["questions"] as? [Any] {
            
            self.id = id
            self.title = title
            self.level = level
            self.questions = questionsJson.compactMap(Question.init)
            self.category = Category(rawValue: category)!
            self.description = jsonDict["description"] as? String
            self.imageUrl = jsonDict["image"] as? String
        } else {
            return nil
        }
    }
}
