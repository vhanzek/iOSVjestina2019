//
//  Quiz.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import Foundation
import UIKit

class Quiz {
    
    let id: Int
    let title: String
    let description: String?
    let category: Category
    let level: Int
    let image: UIImage?
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
            self.questions = questionsJson.compactMap{ Question(json: $0) }
            
            if let category = Category.category(text: category) {
                self.category = category
            } else {
                return nil
            }
            
            if let description = jsonDict["description"] as? String {
                self.description = description
            } else {
                self.description = nil
            }
            
            if let image = jsonDict["image"] as? Data {
                self.image = UIImage(data: image)
            } else {
                self.image = nil
            }
        } else {
            return nil
        }
    }
}
