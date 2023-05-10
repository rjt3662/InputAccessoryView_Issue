//
//  DetailViewController.swift
//  MasterDetailApp
//
//  Created by Rajat Mishra on 06/05/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is inputAccessoryView."
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var accessoryView: UIView = {
        let vw = UIView(frame: CGRect(x: 0,
                                      y: 0,
                                      width: self.view.bounds.size.width,
                                      height: 100))
        vw.backgroundColor = .orange
        return vw
    }()
    
    override var inputAccessoryView: UIView? {
        return accessoryView
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleSearchbarEndEditing),
                                               name: .SearchbarEndEditing,
                                               object: nil)
        title = "Detail Screen"
        accessoryView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: accessoryView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: accessoryView.centerXAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        becomeFirstResponder()
    }
    
    @objc private func handleSearchbarEndEditing(_ sender: NSNotification) {
        becomeFirstResponder()
        view.becomeFirstResponder()
    }
}
