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

