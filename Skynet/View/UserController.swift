//
//  UserController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit

class UserController: UIViewController {
    lazy var labelName: UILabel = {
        let labelName = UILabel(frame: CGRect())
        labelName.text = "Name"
        labelName.textAlignment = NSTextAlignment.center;
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()

    lazy var labelEmail: UILabel = {
        let labelEmail = UILabel(frame: CGRect())
        labelEmail.text = "Name"
        labelEmail.textAlignment = NSTextAlignment.center;
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        return labelEmail
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.title = "User"
    }
}
