//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by I am the owner on 12/16/21.
//

import UIKit

class VC: UIViewController {
    var tableView: UITableView!
    var listOfWordsTop   : [String] = []
    var listOfWordsBottom: [String] = []
    var DDSTop   : UITableViewDiffableDataSource<Sections, String>!
    var DDSBottom: UITableViewDiffableDataSource<Sections, String>!
    
    override func loadView() {
        tableView = UITableView()
        view = tableView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyTableView()
        customizeNavBar()
        configeDDS()
    }
    
    func prettifyTableView() {
        tableView.backgroundColor = .blue
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
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
        let alert = AlertMenager.shared.createAlert { [unowned self] text in
            self.listOfWordsTop.append(text)
            self.makeSnapshotDDS()
        }
        self.present(alert, animated: true, completion: nil)
    }
    
//    MARK: - Diffable DS
    
    func configeDDS() {
       DDSTop = UITableViewDiffableDataSource<Sections, String>(tableView: self.tableView) { (tableView, IndexPath, data) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: IndexPath) as! Cell
            cell.textLabel?.text = data
            return cell
        }
    }
    
    func makeSnapshotDDS() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, String>()
        snapshot.appendSections([.top])
        snapshot.appendItems(listOfWordsTop, toSection: .top)
        DDSTop.apply(snapshot)
    }
}

