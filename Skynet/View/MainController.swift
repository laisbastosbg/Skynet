//
//  ViewController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 09/08/22.
//

import UIKit

class MainController: UIViewController {
    let userViewModel: UserViewModel = UserViewModel()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("get users", for: .normal)
        
        button.addTarget(self, action: #selector(self.getUsers(sender: )), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // Do any additional setup after loading the view.
    }
    @objc func getUsers(sender: UIButton) {
        Task {
            await userViewModel.fetchUsers()
        }
    }
}

