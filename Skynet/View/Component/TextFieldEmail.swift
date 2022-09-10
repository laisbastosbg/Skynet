//
//  TextField.swift
//  Skynet
//
//  Created by Lais Godinho on 23/08/22.
//

import Foundation
import UIKit

class TextFieldEmail: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.borderStyle = .line
        self.placeholder = "Email"
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        
    }
}

//var textFieldEmail: UITextField = {
//    let textFieldEmail = UITextField(frame: CGRect())
//    textFieldEmail.borderStyle = .line
//    textFieldEmail.placeholder = "Email"
//    textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
//    return textFieldEmail
//}()
