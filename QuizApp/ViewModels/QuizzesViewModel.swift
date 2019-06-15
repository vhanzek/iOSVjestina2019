//
//  QuizzesViewModel.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 09/05/2019.
//

import Foundation
import CoreData

struct QuizCellModel {
    
    let id: Int
    let title: String
    let description: String
    let level: String
    let imageUrl: URL?
    
    init(quiz: Quiz) {
        self.id = quiz.id
        self.title = quiz.title
        self.description = quiz.desc ?? ""
        self.level = String(repeating: "*", count: quiz.level)
        self.imageUrl = URL(string: quiz.imageUrl ?? "")
    }
}

class QuizzesViewModel {
    
    private var quizzes: [Quiz]?
    private var isFetched: Bool = false
    
    lazy var frc: NSFetchedResultsController<Quiz> = {
        let request: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nsmTitle", ascending: true)]
        
        let context = DataController.shared.persistentContainer.viewContext
        
        return NSFetchedResultsController<Quiz>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    public func fetchQuizzes(completion: @escaping () -> Void) {
        if Reachability.isConnectedToNetwork() && !self.isFetched {
            QuizService().fetchQuizzes(completion: { [weak self] (quizzes) in
                self?.quizzes = DataController.shared.fetchQuizzes()
                self?.isFetched = true
                completion()
            })
        } else {
            self.quizzes = DataController.shared.fetchQuizzes()
            completion()
        }
    }
    
    public func fetchQuizzes(filter: String, completion: @escaping () -> Void) {
        let predicateFormat = "nsmTitle CONTAINS[c] %@ OR nsmDescription CONTAINS[c] %@"
        frc.fetchRequest.predicate = filter.isEmpty ? nil :
            NSPredicate(format: predicateFormat, filter, filter)
        
        do {
            try frc.performFetch()
        } catch {
            print("Fetch did not succeed")
        }
        
        if let quizzes = frc.fetchedObjects {
            self.quizzes = quizzes
        }
        completion()
    }
    
    public func numberOfQuizzes(category: Category) -> Int {
        return quizzesByCategory(category: category)?.count ?? 0
    }
    
    public func quizViewModel(forIndexPath indexPath: IndexPath) -> QuizViewModel? {
        let category = Category.allCases[indexPath.section]
        guard let quizzes = quizzesByCategory(category: category) else {
            return nil
        }
        return QuizViewModel(quiz: quizzes[indexPath.row])
    }
    
    public func quiz(forIndexPath indexPath: IndexPath) -> QuizCellModel? {
        let category = Category.allCases[indexPath.section]
        guard let quizzes = quizzesByCategory(category: category) else {
            return nil
        }
        return QuizCellModel(quiz: quizzes[indexPath.row])
    }
    
    public func quizzesByCategory(category: Category) -> [Quiz]? {
        return quizzes?.filter{$0.category == category}
    }
    
}
