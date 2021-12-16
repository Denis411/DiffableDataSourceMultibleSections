//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by I am the owner on 12/16/21.
//

import UIKit

class VC: UIViewController {
    var tableView: UITableView!
    
    override func loadView() {
        tableView = UITableView()
        view = tableView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyTableView()
        customizeNavBar()
    }
    
    func prettifyTableView() {
        tableView.backgroundColor = .blue
    }
    
    func customizeNavBar() {
        let button = createNavBarButton()
        self.navigationItem.setRightBarButton(button, animated: true)
        
    }
    
    func createNavBarButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(callAlert))
        return button
    }
    
   @objc func callAlert() {
        print("all good")
    }
}

