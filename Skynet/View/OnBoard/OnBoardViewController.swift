//
//  Launch.swift
//  Skynet
//
//  Created by Lais Godinho on 23/08/22.
//

import Foundation
import UIKit

class OnBoardViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Welcome to Skynet"
        title.textColor = UIColor(named: "Secondary")
        title.font = UIFont.preferredFont(forTextStyle: .title1)
        title.adjustsFontForContentSizeCategory = true
        
        return title
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "undraw_stars")
        return image
    }()
    
    
    lazy var signInWithEmailButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in with email", for: .normal)
        button.configuration = .filled()
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        let icon = UIImage(systemName: "envelope.fill")
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account yet?"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.addTarget(self, action: #selector(openRegistrationSheet), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
                view.addSubview(imageView)
        view.addSubview(signInWithEmailButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
        view.backgroundColor = UIColor(named: "Primary")
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            imageView.heightAnchor.constraint(equalToConstant: 244),
            imageView.widthAnchor.constraint(equalToConstant: 330),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInWithEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithEmailButton.heightAnchor.constraint(equalToConstant: 48),
            signInWithEmailButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 96),
            signInWithEmailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            signInWithEmailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            signUpLabel.leadingAnchor.constraint(equalTo: signInWithEmailButton.leadingAnchor),
            signUpLabel.topAnchor.constraint(equalTo: signInWithEmailButton.bottomAnchor, constant: 8),
            
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor, constant: 4),
            signUpButton.centerYAnchor.constraint(equalTo: signUpLabel.centerYAnchor),
            
        ])
    }
    
    @objc func login() {
        let nextPage = LoginController()
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    @objc func openRegistrationSheet() {
        let registrationController = RegistrationController()
        
        if let sheet = registrationController.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
        }
        self.present(registrationController, animated: true)
    }
}
