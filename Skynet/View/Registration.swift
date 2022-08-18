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
    
    lazy var textFieldTittle: UITextView = {
        let textFieldTittle = UITextView(frame: CGRect())
        textFieldTittle.text = "SignIn"
        textFieldTittle.translatesAutoresizingMaskIntoConstraints = false
        return textFieldTittle
    }()

    lazy var textFieldName: UITextField = {
        let textFieldName = UITextField(frame: CGRect())
        textFieldName.backgroundColor = .blue
        textFieldName.text = "Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldName
    }()

    lazy var textFieldEmail: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.backgroundColor = .blue
        textFieldEmail.text = "Email"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var textFieldPassword: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.backgroundColor = .blue
        textFieldEmail.text = "Password"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var textFieldConfirmPassword: UITextField = {
        let textFieldConfirmPassword = UITextField(frame: CGRect())
        textFieldConfirmPassword.backgroundColor = .blue
        textFieldConfirmPassword.text = "Confirm"
        textFieldConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        return textFieldConfirmPassword
    }()

    lazy var buttonRegister: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.backgroundColor = .blue
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.setTitle("Sign In", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonRegister.setTitleColor(.white, for: .normal)
        buttonRegister.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return buttonRegister
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textFieldTittle)
        view.addSubview(textFieldName)
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldPassword)
//        view.addSubview(textFieldConfirmPassword)
        view.addSubview(buttonRegister)
        self.title = "Seach"
        setConstraints()
    }

    func setConstraints(){
        setConstraintTextFieldTittle()
        setConstraintTextFieldName()
        setConstraintTextFieldEmail()
        setConstraintTextFieldPassword()
//        setConstraintTextFieldConfirmPassword()
        setConstraintButtonRegister()
    }

    func setConstraintTextFieldTittle(){
        NSLayoutConstraint.activate([
            textFieldTittle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldTittle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            textFieldTittle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            textFieldTittle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintTextFieldName(){
        NSLayoutConstraint.activate([
            textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            textFieldName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            textFieldName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),

        ])
    }
    
    func setConstraintTextFieldEmail(){
        NSLayoutConstraint.activate([
            textFieldEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldEmail.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            textFieldEmail.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            textFieldEmail.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintTextFieldPassword(){
        NSLayoutConstraint.activate([
            textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            textFieldPassword.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            textFieldPassword.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintTextFieldConfirmPassword(){
        NSLayoutConstraint.activate([
            textFieldConfirmPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldConfirmPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            textFieldConfirmPassword.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            textFieldConfirmPassword.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintButtonRegister(){
        NSLayoutConstraint.activate([
            buttonRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonRegister.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            buttonRegister.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            buttonRegister.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
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
    }
}
