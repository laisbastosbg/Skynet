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

    lazy var buttonPost: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("get users", for: .normal)

        button.addTarget(self, action: #selector(self.createUser(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(buttonPost)
        
        NSLayoutConstraint.activate([

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),


            buttonPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPost.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10)
        ])
        // Do any additional setup after loading the view.
    }


    @objc func getUsers(sender: UIButton) {
        Task {
            await userViewModel.fetchUsers()
        }
    }

    @objc func createUser(sender: UIButton) {
        Task {
            let user = User(name: "Joan", email: "Joan32@gmail.com", password: "sen22ha34")
            await userViewModel.addUser(user: user)
        }
    }

}

