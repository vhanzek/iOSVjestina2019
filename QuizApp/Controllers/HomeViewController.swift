//
//  ViewController.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import UIKit

class HomeViewController: QuizzesViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(viewModel: QuizzesViewModel) {
        self.init()
        super.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(tableView: self.tableView)
        setupTableView(tableView: self.tableView)
    }
    
}
