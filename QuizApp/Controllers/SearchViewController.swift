//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 01/06/2019.
//

import UIKit

class SearchViewController: QuizzesViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    convenience init(viewModel: QuizzesViewModel) {
        self.init()
        super.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(tableView: self.tableView)
        setupTableView(tableView: self.tableView)
    }
    
    @IBAction func searchClicked(_ sender: UIButton) {
        let filter = searchTextField.text ?? ""
        viewModel.fetchQuizzes(filter: filter) {
            self.refresh(tableView: self.tableView)
        }
    }
}
