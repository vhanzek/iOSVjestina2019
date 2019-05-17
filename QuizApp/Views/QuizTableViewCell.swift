//
//  QuizTableViewCell.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 09/05/2019.
//

import UIKit
import Kingfisher

class QuizTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        difficultyLabel.text = ""
        descriptionLabel.text = ""
        quizImageView?.image = nil
    }
    
    private func setupTableViewCell() {
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        difficultyLabel.font = UIFont.systemFont(ofSize: 16)
        difficultyLabel.textColor = UIColor.red
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.numberOfLines = 2
    }
    
    func setup(withQuiz quiz: QuizCellModel) {
        self.titleLabel.text = quiz.title
        self.descriptionLabel.text = quiz.description
        self.difficultyLabel.text = quiz.level
        
        if let url = quiz.imageUrl {
            self.quizImageView.kf.setImage(with: url)
        }
    }
    
}
