//
//  QuestionView.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 31/03/2019.
//

import UIKit

class QuestionView: UIView {
    
    private var questionObject: Question!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func questionAnswered(_ sender: Any) {
        if let button = sender as? UIButton {
            button.backgroundColor =
                button.tag == self.question.correctAnswer ? .green : .red
            self.answerButtons.forEach({$0.isEnabled = false})
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    var question: Question {
        get {
            return self.questionObject
        }
        set(question) {
            self.questionObject = question
            self.questionLabel.text = question.question
            self.answerButtons.enumerated().forEach{
                $1.setTitle(question.answers[$0], for: .normal)
                $1.backgroundColor = .clear
                $1.isEnabled = true
            }
        }
    }
    
}
