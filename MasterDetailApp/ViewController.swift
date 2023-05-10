//
//  ViewController.swift
//  MasterDetailApp
//
//  Created by Rajat Mishra on 06/05/23.
//

import UIKit

class RootViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var txtField: UITextField!
    
    fileprivate lazy var searchVC: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "New Search Text..."
        controller.searchBar.delegate = self
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchVC
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension RootViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        NotificationCenter.default.post(name: .SearchbarEndEditing, object: nil)
    }
    
}

extension NSNotification.Name {
    static let SearchbarEndEditing = NSNotification.Name("SEARCHBAR_END_EDITING")
}
