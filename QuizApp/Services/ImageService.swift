//
//  ImageService.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 12/04/2019.
//

import Foundation
import UIKit

class ImageService {
    
    func fetchImage(urlString: String, completion: @escaping ((UIImage?) -> Void)) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
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
