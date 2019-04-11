//
//  QuizService.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import Foundation
import UIKit

class QuizService {
    
    let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
    
    func fetchQuizzes(completion: @escaping (([Quiz]?) -> Void)) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let jsonDict = json as? [String: Any],
                            let quizzesList = jsonDict["quizzes"] as? [Any] {
                            let quizzes = quizzesList.compactMap{ Quiz(json: $0) }
                            completion(quizzes)
                        } else {
                            completion(nil)
                        }
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
    
    }
}
