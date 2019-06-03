//
//  ScoresTableViewHeader.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 01/06/2019.
//

import UIKit
import PureLayout

class ScoresTableSectionHeader: UIView {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        titleLabel = UILabel()
        titleLabel.text = "Scores"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.darkGray
        self.addSubview(titleLabel)
        
        titleLabel.autoCenterInSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
