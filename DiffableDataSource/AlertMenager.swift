//
//  AlertMenager.swift
//  DiffableDataSource
//
//  Created by I am the owner on 12/16/21.
//

import UIKit

final class AlertMenager {
    static let shared = AlertMenager()
    
    func createAlert(action: @escaping (String) -> ()) {
        let alert = UIAlertController(title: "Add", message: "Add a city to the list", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {
                return
            }
            action(text)
        }
        alert.addAction(add)
    }
}
