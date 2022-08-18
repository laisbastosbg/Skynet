//
//  PublishController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit


class PublishController: UIViewController {
    let postViewModel = PostViewModel()
    
    lazy var textFieldPost: UITextView = {
        let textFieldPost = UITextView(frame: CGRect())
        textFieldPost.backgroundColor = .white
//        textFieldPost.placeholder = "Comente aqui!"
        textFieldPost.translatesAutoresizingMaskIntoConstraints = false
        return textFieldPost
    }()

    lazy var buttonSent: UIButton = {
        let buttonSent = UIButton(type: .system)
        buttonSent.backgroundColor = .blue
        buttonSent.translatesAutoresizingMaskIntoConstraints = false
        buttonSent.setTitle("Send", for: .normal)
        buttonSent.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonSent.setTitleColor(.white, for: .normal)
        buttonSent.addTarget(self, action: #selector(publish), for: .touchUpInside)
        return buttonSent
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
        self.title = "Publish"
        view.addSubview(textFieldPost)
        view.addSubview(buttonSent)


        NSLayoutConstraint.activate([
            textFieldPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldPost.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -30),
            textFieldPost.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                  multiplier: 0.7),
            textFieldPost.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),


            buttonSent.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonSent.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 340),

            buttonSent.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 0.05),
            buttonSent.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),


        ])
    }

    @objc func publish() {
        let content = textFieldPost.text!
        
        Task {
            guard let tokenData = KeychainHelper.standard.read(service: "access-token", account: "skynet") else {
                print("nenhum token encontrado")
                return
            }
            
            let token = String(data: tokenData, encoding: .utf8)!
            
            let post = Post.create(content: content)
            
            let contentType = "text/plain"
            
            await postViewModel.addPost(post, contentType, token)
        }
    }

}
