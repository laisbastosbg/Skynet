//
//  Registration.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit

class RegistrationController: UIViewController {
    let userViewModel = UserViewModel()
    
    lazy var textFieldTitle: UILabel = {
        let textFieldTitle = UILabel(frame: CGRect())
        textFieldTitle.text = "Sign Up"
        textFieldTitle.font = UIFont.preferredFont(forTextStyle: .title3)
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        return textFieldTitle
    }()

    lazy var textFieldName: UITextField = {
        let textFieldName = UITextField(frame: CGRect())
        textFieldName.borderStyle = .roundedRect
        textFieldName.placeholder = "Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldName
    }()

    lazy var textFieldEmail: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.placeholder = "Email"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var textFieldPassword: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.placeholder = "Password"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var buttonRegister: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.setTitle("Continue", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .filled()
        buttonRegister.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return buttonRegister
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Primary")
        view.addSubview(textFieldTitle)
        view.addSubview(textFieldName)
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldPassword)
//        view.addSubview(textFieldConfirmPassword)
        view.addSubview(buttonRegister)
        self.title = "Seach"
        setConstraints()
    }

    func setConstraints(){
        setConstraintTextFieldTitle()
        setConstraintTextFieldName()
        setConstraintTextFieldEmail()
        setConstraintTextFieldPassword()
//        setConstraintTextFieldConfirmPassword()
        setConstraintButtonRegister()
    }

    func setConstraintTextFieldTitle(){
        NSLayoutConstraint.activate([
            textFieldTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
        ])
    }

    func setConstraintTextFieldName(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 64),
            textFieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            textFieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            textFieldName.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setConstraintTextFieldEmail(){
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: textFieldName.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: textFieldName.trailingAnchor),
            textFieldEmail.heightAnchor.constraint(equalTo: textFieldName.heightAnchor)
        ])
    }

    func setConstraintTextFieldPassword(){
        NSLayoutConstraint.activate([
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: textFieldName.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: textFieldName.trailingAnchor),
            textFieldPassword.heightAnchor.constraint(equalTo: textFieldName.heightAnchor)
        ])
    }

    func setConstraintButtonRegister(){
        NSLayoutConstraint.activate([
            buttonRegister.heightAnchor.constraint(equalToConstant: 48),
            buttonRegister.leadingAnchor.constraint(equalTo: textFieldName.leadingAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: textFieldName.trailingAnchor),
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32)
        ])
    }
    
    @objc func signIn() {
        let name = textFieldName.text!
        let email = textFieldEmail.text!
        let password = textFieldPassword.text!
        
        if(
            email.count < 1 ||
            name.count < 1 ||
            password.count < 1
        ) {
            print("vazio")
        } else {
            let user = User(id: nil, name: name, email: email, password: password)
            
            Task {
                await userViewModel.addUser(user: user)
            }

        }
        self.dismiss(animated: true)

    }
}
