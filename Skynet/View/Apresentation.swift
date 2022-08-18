//
//  Apresentation.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 18/08/22.
//

import Foundation
import UIKit

class Apresentation: UIViewController {
    lazy var imageEyes: UIImageView = {
        let eyes = UIImage(named: "eyes")
        let imageEyes = UIImageView(image: eyes)
        imageEyes.image = eyes
        imageEyes.contentMode = .scaleAspectFill
        imageEyes.translatesAutoresizingMaskIntoConstraints = false
        return imageEyes
    }()

    lazy var labelSalutation: UILabel = {
        let textFieldTittle = UILabel(frame: CGRect())
        textFieldTittle.backgroundColor = .white
        textFieldTittle.text = "Find your net or die trying!!!"
        textFieldTittle.font = UIFont(name: "Arial", size: 60)
        textFieldTittle.translatesAutoresizingMaskIntoConstraints = false
        return textFieldTittle
    }()

    lazy var labelSubSalutation: UILabel = {
        let textFieldTittle = UILabel(frame: CGRect())
        textFieldTittle.backgroundColor = .white
        textFieldTittle.text = "Find your net or die trying!!!"
        textFieldTittle.font = UIFont(name: "Arial", size: 60)
        textFieldTittle.translatesAutoresizingMaskIntoConstraints = false
        return textFieldTittle
    }()

    lazy var buttonGetStarted: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        //button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(imageEyes)
        
    }

    func setConstraintsImageEyes() {
        NSLayoutConstraint.activate([
            imageEyes.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageEyes.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageEyes.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 1),
            imageEyes.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsLabelSalutation() {
        NSLayoutConstraint.activate([
            labelSalutation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelSalutation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelSalutation.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 1),
            labelSalutation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsLabelSubSalutation() {
        NSLayoutConstraint.activate([
            labelSubSalutation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelSubSalutation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelSubSalutation.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 1),
            labelSubSalutation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }

    func setConstraintsButtonGetStarted() {
        NSLayoutConstraint.activate([
            buttonGetStarted.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGetStarted.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonGetStarted.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                   multiplier: 1),
            buttonGetStarted.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }
}
