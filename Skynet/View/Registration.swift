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
        textFieldName.autocorrectionType = .no
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        return textFieldName
    }()

    lazy var textFieldEmail: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.placeholder = "Email"
        textFieldEmail.autocorrectionType = .no
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var textFieldPassword: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.placeholder = "Password"
        textFieldEmail.isSecureTextEntry = true
        textFieldEmail.autocorrectionType = .no
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
    
    lazy var leftDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var rightDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var alternativeSignUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or"
        label.textColor = .gray
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var signUpWithApple: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.tintColor = .black
        buttonRegister.setTitle("Sign up with Apple", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .filled()
        buttonRegister.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return buttonRegister
    }()
    
    lazy var signUpWithGoogle: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.tintColor = .black
        buttonRegister.setTitle("Sign up with Google", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .bordered()
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
        view.addSubview(leftDivider)
        view.addSubview(alternativeSignUpLabel)
        view.addSubview(rightDivider)
        view.addSubview(signUpWithApple)
        view.addSubview(buttonRegister)
        view.addSubview(signUpWithGoogle)
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
        setConstraintLeftDivider()
        setAlternativeSignUpLabel()
        setConstraintRightDivider()
        setConstraintSignUpWithApple()
        setConstraintSignUpWithGoogle()
    }
    
    func setConstraintSignUpWithGoogle() {
        NSLayoutConstraint.activate([
            signUpWithGoogle.topAnchor.constraint(equalTo: signUpWithApple.bottomAnchor, constant: 32),
            signUpWithGoogle.leadingAnchor.constraint(equalTo: buttonRegister.leadingAnchor),
            signUpWithGoogle.trailingAnchor.constraint(equalTo: buttonRegister.trailingAnchor),
            signUpWithGoogle.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintSignUpWithApple() {
        NSLayoutConstraint.activate([
            signUpWithApple.topAnchor.constraint(equalTo: alternativeSignUpLabel.bottomAnchor, constant: 32),
            signUpWithApple.leadingAnchor.constraint(equalTo: buttonRegister.leadingAnchor),
            signUpWithApple.trailingAnchor.constraint(equalTo: buttonRegister.trailingAnchor),
            signUpWithApple.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintLeftDivider() {
        NSLayoutConstraint.activate([
            leftDivider.heightAnchor.constraint(equalToConstant: 0.5),
            leftDivider.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 32),
            leftDivider.leadingAnchor.constraint(equalTo: buttonRegister.leadingAnchor),
            leftDivider.trailingAnchor.constraint(equalTo: alternativeSignUpLabel.leadingAnchor, constant: -8)
        ])
    }
    
    func setAlternativeSignUpLabel() {
        NSLayoutConstraint.activate([
            alternativeSignUpLabel.centerYAnchor.constraint(equalTo: leftDivider.centerYAnchor),
            alternativeSignUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setConstraintRightDivider() {
        NSLayoutConstraint.activate([
            rightDivider.heightAnchor.constraint(equalTo: leftDivider.heightAnchor),
            rightDivider.topAnchor.constraint(equalTo: leftDivider.topAnchor),
            rightDivider.trailingAnchor.constraint(equalTo: buttonRegister.trailingAnchor),
            rightDivider.leadingAnchor.constraint(equalTo: alternativeSignUpLabel.trailingAnchor, constant: 8)
        ])
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
