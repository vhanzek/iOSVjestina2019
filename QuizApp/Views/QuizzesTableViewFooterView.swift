//
//  QuizzesTableViewFooterView.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 14/05/2019.
//

import UIKit

class QuizzesTableViewFooterView: UIView {
    
    var logoutButton: UIButton!
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        AuthorizationUtils.logoutUser()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightText
        
        logoutButton = UIButton()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        addSubview(logoutButton)
        logoutButton.autoCenterInSuperview()
        
        logoutButton.addTarget(self, action: #selector(QuizzesTableViewFooterView.logoutButtonTapped(_:)), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
