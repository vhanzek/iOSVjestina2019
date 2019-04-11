//
//  Category.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import Foundation
import UIKit

enum Category {
    
    case sports
    case science
    
    static func category(text: String) -> Category? {
        switch text.uppercased() {
            case "SPORTS":
                return .sports
            case "SCIENCE":
                return .science
            default:
                return nil
        }
    }
    
    var color: UIColor {
        switch self {
        case .sports:
            return UIColor.red
        case .science:
            return UIColor.green
        }
    }
    
    var text: String {
        switch self {
            case .sports:
                return "SPORTS"
            case .science:
                return "SCIENCE"
        }
    }
}
