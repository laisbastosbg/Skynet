//
//  PublishController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit


class PublishController: UIViewController {
    lazy var textFieldPost: UITextField = {
        let textFieldPost = UITextField(frame: CGRect())
        textFieldPost.backgroundColor = .white
        textFieldPost.text = "Comente aqui!"
        textFieldPost.translatesAutoresizingMaskIntoConstraints = false
        return textFieldPost
    }()

    lazy var buttonSent: UIButton = {
        let buttonSent = UIButton(type: .system)
        buttonSent.backgroundColor = .blue
        buttonSent.translatesAutoresizingMaskIntoConstraints = false
        buttonSent.setTitle("Sent", for: .normal)
        buttonSent.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonSent.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return buttonSent
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
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



}
