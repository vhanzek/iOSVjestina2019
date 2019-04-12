//
//  ViewController.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import UIKit

class InitialViewController: UIViewController {
    
    private final let quizService = QuizService()
    private final let imageService = ImageService()
    
    var questionView: QuestionView?
    
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var quizTitleLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var questionViewContainer: UIView!
    
    @IBAction func fecthButtonAction(_ sender: UIButton) {
        fetchQuizzes()
    }
    
    func fetchQuizzes() {
        quizService.fetchQuizzes(completion: { (quizzes) in
            DispatchQueue.main.async {
                if let quizzes = quizzes, let quiz = quizzes.randomElement() {
                    self.setFunFact(quizzes: quizzes)
                    self.setQuizData(quiz: quiz)
                    self.setQuestionData(question: quiz.questions.randomElement()!)
                } else {
                    UIUtils.showError(message: "Internal server error", view: self.view)
                }
            }
        })
    }
    
    private func setFunFact(quizzes: [Quiz]) {
        let nbaQuestions = quizzes.map{$0.questions}.flatMap{$0}.filter{$0.question.contains("NBA")}
        
        self.funFactLabel.text = "FUN FACT: \(nbaQuestions.count)"
        self.funFactLabel.sizeToFit()
        self.funFactLabel.center.x = self.view.center.x
    }
    
    private func setQuizData(quiz: Quiz) {
        self.quizTitleLabel.text = quiz.title
        self.quizTitleLabel.backgroundColor = quiz.category.color
        self.quizTitleLabel.sizeToFit()
        self.quizTitleLabel.center.x = self.view.center.x
        
        if let imageUrl = quiz.imageUrl {
            imageService.fetchImage(urlString: imageUrl, completion: { (image) in
                DispatchQueue.main.async {
                    self.quizImage.image = image
                    self.quizImage.center.x = self.view.center.x
                }
            })
        }
    }
    
    private func setQuestionData(question: Question) {
        if self.questionViewContainer.subviews.count == 0 {
            self.questionView = QuestionView(
                frame: CGRect(origin: CGPoint(x: 0, y: 0),
                              size: self.questionViewContainer.frame.size))
            if let questionView = self.questionView {
                self.questionViewContainer.addSubview(questionView)
            }
        }
        if let questionView = self.questionView {
            questionView.question = question
        }
    }
    
}
