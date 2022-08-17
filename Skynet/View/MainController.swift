//
//  ViewController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 09/08/22.
//

import UIKit

class MainController: UIViewController {
    let userViewModel: UserViewModel = UserViewModel()
    let postViewModel: PostViewModel = PostViewModel()
    
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
        button.setTitle("set users", for: .normal)

        button.addTarget(self, action: #selector(self.createUser(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("login", for: .normal)

        button.addTarget(self, action: #selector(self.login(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("logout", for: .normal)

        button.addTarget(self, action: #selector(self.logout(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var listPostsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("get posts", for: .normal)

        button.addTarget(self, action: #selector(self.getPosts(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(buttonPost)
        view.addSubview(loginButton)
        view.addSubview(logoutButton)
        view.addSubview(listPostsButton)
        NSLayoutConstraint.activate([

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),

            buttonPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPost.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            
            listPostsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listPostsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
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
            let user = User(id: nil, name: "Monica", email: "monica@gmail.com", password: "sansao")
            await userViewModel.addUser(user: user)
        }
    }
    
    @objc func login(sender: UIButton) {
        Task {
            let user = User.authentication(username: "monica@gmail.com", password: "sansao")
            await userViewModel.login(user: user)
        }
    }
    
    @objc func logout(sender: UIButton) {
        Task {
            guard let tokenData = KeychainHelper.standard.read(service: "access-token", account: "skynet") else {
                print("nenhum token encontrado")
                return
            }
            
            let token = String(data: tokenData, encoding: .utf8)!
            await userViewModel.logout(token: token)
        }
    }
    
    
    @objc func getPosts(sender: UIButton) {
        Task {
            await postViewModel.fetchPosts()
        }
    }

}

