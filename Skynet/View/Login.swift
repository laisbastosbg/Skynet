//
//  Login.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    let userViewModel = UserViewModel()
    var loginError = false
    
    lazy var pageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.text = "Sign in"
        return label
    }()
    
    lazy var textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
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
        buttonRegister.setTitle("Log in with Apple", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .filled()
        buttonRegister.addTarget(self, action: #selector(login), for: .touchUpInside)
        return buttonRegister
    }()
    
    lazy var signUpWithGoogle: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.tintColor = .black
        buttonRegister.setTitle("Log in with Google", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .bordered()
        buttonRegister.addTarget(self, action: #selector(login), for: .touchUpInside)
        return buttonRegister
    }()
    
    lazy var loginErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Email ou senha incorretos"
        label.textColor = .red
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageTitle)
        view.backgroundColor = UIColor(named: "Primary")
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        view.addSubview(leftDivider)
        view.addSubview(alternativeSignUpLabel)
        view.addSubview(rightDivider)
        view.addSubview(signUpWithApple)
        view.addSubview(signUpWithGoogle)
        setConstraints()
    }
    
    func setConstraints(){
        self.setConstraintsPageTitle()
        self.setConstraintsTextFieldEmail()
        self.setConstraintsTextFieldPassword()
        self.setConstraintsButtonLogin()
        self.setConstraintLeftDivider()
        self.setAlternativeSignUpLabel()
        self.setConstraintRightDivider()
        self.setConstraintSignUpWithApple()
        self.setConstraintSignUpWithGoogle()
    }
    
    func setConstraintSignUpWithGoogle() {
        NSLayoutConstraint.activate([
            signUpWithGoogle.topAnchor.constraint(equalTo: signUpWithApple.bottomAnchor, constant: 32),
            signUpWithGoogle.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor),
            signUpWithGoogle.trailingAnchor.constraint(equalTo: buttonLogin.trailingAnchor),
            signUpWithGoogle.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintSignUpWithApple() {
        NSLayoutConstraint.activate([
            signUpWithApple.topAnchor.constraint(equalTo: alternativeSignUpLabel.bottomAnchor, constant: 32),
            signUpWithApple.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor),
            signUpWithApple.trailingAnchor.constraint(equalTo: buttonLogin.trailingAnchor),
            signUpWithApple.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintLeftDivider() {
        NSLayoutConstraint.activate([
            leftDivider.heightAnchor.constraint(equalToConstant: 0.5),
            leftDivider.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 32),
            leftDivider.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor),
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
            rightDivider.trailingAnchor.constraint(equalTo: buttonLogin.trailingAnchor),
            rightDivider.leadingAnchor.constraint(equalTo: alternativeSignUpLabel.trailingAnchor, constant: 8)
        ])
    }
    
    func setConstraintsPageTitle() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32)
        ])
    }

    func setConstraintsTextFieldEmail() {
        NSLayoutConstraint.activate([
            self.textFieldEmail.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 32),
            self.textFieldEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            self.textFieldEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            self.textFieldEmail.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func setConstraintsTextFieldPassword() {
        NSLayoutConstraint.activate([
            self.textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            self.textFieldPassword.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor),
            self.textFieldPassword.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor),
            self.textFieldPassword.heightAnchor.constraint(equalTo: textFieldEmail.heightAnchor)
        ])
    }

    func setConstraintsButtonLogin() {
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
            buttonLogin.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor),
            buttonLogin.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor),
            buttonLogin.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    
    @objc func login() {
        let email = textFieldEmail.text!
        let password = textFieldPassword.text!
        let user = User.authentication(username: email, password: password)
        
        Task {
            let loginStatus = await userViewModel.login(user: user)
            
            if (loginStatus == 200) {
                let mainController = MainController()
                self.navigationController?.pushViewController(mainController, animated: false)
            } else {
                loginError = true
                print("usuario ou senha incorretos")
            }
        }
    }
}


