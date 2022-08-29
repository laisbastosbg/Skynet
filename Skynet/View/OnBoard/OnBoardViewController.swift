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
        let image = UIImage(named: "undraw_stars")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = 100
        imageView.frame.size.height = 100
        
        return imageView
    }()
    
    
    lazy var signInWithEmailButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.backgroundColor = UIColor(named: "CallToAction")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in with email", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        let icon = UIImage(systemName: "envelope.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal
        )
        button.setImage(icon, for: .normal)
        //        button.imageView?.image = UIImage(systemName: "envelope")
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        return button
    }()
    
    lazy var recoverPasswordButton: UIButton = {
       let button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        title.textAlignment = .justified
        view.addSubview(titleLabel)
                view.addSubview(imageView)
        view.addSubview(signInWithEmailButton)
        view.backgroundColor = UIColor(named: "Primary")
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
//                        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant),
//                        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant)
            
            signInWithEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            signInWithEmailButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            signInWithEmailButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            signInWithEmailButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
        ])
    }
    
    @objc func login() {
        
    }
}
