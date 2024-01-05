//
//  Launch.swift
//  Skynet
//
//  Created by Lais Godinho on 23/08/22.
//

import Foundation
import UIKit

class OnBoardViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 5000
//        scrollView.contentSize = CGSize(
//        scrollView.bounces = true
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
//        scrollView.
        return scrollView
    }()
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
    
    lazy var signUpStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        buttonRegister.setTitle("Continue with Apple", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .filled()
        buttonRegister.addTarget(self, action: #selector(login), for: .touchUpInside)
        return buttonRegister
    }()
    
    lazy var signUpWithGoogle: UIButton = {
        let buttonRegister = UIButton(type: .system)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.tintColor = .black
        buttonRegister.setTitle("Continue with Google", for: .normal)
        buttonRegister.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        buttonRegister.configuration = .bordered()
        buttonRegister.addTarget(self, action: #selector(login), for: .touchUpInside)
        return buttonRegister
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(imageView)
        scrollView.addSubview(signInWithEmailButton)
        scrollView.addSubview(signUpStack)
        signUpStack.addArrangedSubview(signUpLabel)
        signUpStack.addArrangedSubview(signUpButton)
        scrollView.addSubview(leftDivider)
//        scrollView.subview
        scrollView.addSubview(alternativeSignUpLabel)
        scrollView.addSubview(rightDivider)
        scrollView.addSubview(signUpWithApple)
        scrollView.addSubview(signUpWithGoogle)
        scrollView.backgroundColor = UIColor(named: "Primary")
        
        self.setConstraintLeftDivider()
        self.setAlternativeSignUpLabel()
        self.setConstraintRightDivider()
        self.setConstraintSignUpWithApple()
        self.setConstraintSignUpWithGoogle()
        self.setConstraintSignUpStack()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            imageView.heightAnchor.constraint(equalToConstant: 244),
            imageView.widthAnchor.constraint(equalToConstant: 330),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInWithEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithEmailButton.heightAnchor.constraint(equalToConstant: 48),
            signInWithEmailButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 96),
            signInWithEmailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            signInWithEmailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
        ])
    }
    
    func setConstraintSignUpStack() {
        NSLayoutConstraint.activate([
            signUpStack.topAnchor.constraint(equalTo: signInWithEmailButton.bottomAnchor, constant: 8),
            signUpStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.70)
        ])
    }
    
    func setConstraintSignUpWithGoogle() {
        NSLayoutConstraint.activate([
            signUpWithGoogle.topAnchor.constraint(equalTo: signUpWithApple.bottomAnchor, constant: 16),
            signUpWithGoogle.leadingAnchor.constraint(equalTo: signInWithEmailButton.leadingAnchor),
            signUpWithGoogle.trailingAnchor.constraint(equalTo: signInWithEmailButton.trailingAnchor),
            signUpWithGoogle.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintSignUpWithApple() {
        NSLayoutConstraint.activate([
            signUpWithApple.topAnchor.constraint(equalTo: alternativeSignUpLabel.bottomAnchor, constant: 16),
            signUpWithApple.leadingAnchor.constraint(equalTo: signInWithEmailButton.leadingAnchor),
            signUpWithApple.trailingAnchor.constraint(equalTo: signInWithEmailButton.trailingAnchor),
            signUpWithApple.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setConstraintLeftDivider() {
        NSLayoutConstraint.activate([
            leftDivider.heightAnchor.constraint(equalToConstant: 0.5),
            leftDivider.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 16),
            leftDivider.leadingAnchor.constraint(equalTo: signInWithEmailButton.leadingAnchor),
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
            rightDivider.trailingAnchor.constraint(equalTo: signInWithEmailButton.trailingAnchor),
            rightDivider.leadingAnchor.constraint(equalTo: alternativeSignUpLabel.trailingAnchor, constant: 8)
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
