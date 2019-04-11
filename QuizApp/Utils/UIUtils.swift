//
//  UIUtils.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 06/04/2019.
//

import Foundation
import UIKit

class UIUtils {
    
    static func showError(message: String, view: UIView) {
        let toastLabel = UILabel(
            frame: CGRect(x: view.frame.size.width / 2 - 75,
                          y: view.frame.size.height - 100,
                          width: 175, height: 35))
        
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
