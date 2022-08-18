//
//  Login.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit


class LoginController: UIViewController {
    lazy var textFieldEmail: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.backgroundColor = .white
        textFieldEmail.text = "Email"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var textFieldPassword: UITextField = {
        let textFieldEmail = UITextField(frame: CGRect())
        textFieldEmail.backgroundColor = .white
        textFieldEmail.text = "Password"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        return textFieldEmail
    }()

    lazy var buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()

    lazy var buttonRegistration: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.registration), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let apresentationController = Apresentation()
        if let sheet = apresentationController.sheetPresentationController{
            sheet.detents = [.large()]
        }
        self.present(apresentationController, animated: true)

        view.backgroundColor = .gray
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        view.addSubview(buttonRegistration)
        setConstraints()
    }

    func setConstraints(){
        setConstraintsTextFieldEmail()
        setConstraintsTextFieldPassword()
        setConstraintsButtonLogin()
        setConstraintsButtonRegistration()
    }

    func setConstraintsTextFieldEmail() {
        NSLayoutConstraint.activate([
            textFieldEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldEmail.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            textFieldEmail.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 0.05),
            textFieldEmail.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsTextFieldPassword() {
        NSLayoutConstraint.activate([
            textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textFieldPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            textFieldPassword.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 0.05),
            textFieldPassword.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsButtonLogin() {
        NSLayoutConstraint.activate([
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            buttonLogin.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 0.05),
            buttonLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsButtonRegistration() {
        NSLayoutConstraint.activate([
            buttonRegistration.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonRegistration.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            buttonRegistration.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 0.05),
            buttonRegistration.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    @objc func login() {
        print(textFieldEmail.text!, textFieldPassword.text!)
        let mainController = MainController()
        self.navigationController?.pushViewController(mainController, animated: false)

    }

    @objc func registration() {
        let registrationController = RegistrationController()

        if let sheet = registrationController.sheetPresentationController{
            sheet.detents = [.medium()]
        }
        self.present(registrationController, animated: true)
    }
}


