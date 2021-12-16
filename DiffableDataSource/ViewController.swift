//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by I am the owner on 12/16/21.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    
    override func loadView() {
        tableView = UITableView()
        view = tableView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyTableView()
        
    }
    
    func prettifyTableView() {
        tableView.backgroundColor = .blue
    }
}

