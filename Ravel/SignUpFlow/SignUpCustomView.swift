//
//  CustomView.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class SignUpCustomView: UIView {
    
    init() {
        super.init(frame:.zero)
        addSubview(imageView)
        addSubview(label)
        addSubview(stackView)
        addSubview(signUpButton)
        
        imageView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, centerX: nil, centerY: nil,  width: 0, height: 0)
        
        label.anchor(top: self.topAnchor, paddingTop: 200, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: self.centerXAnchor, centerY: nil, width: 0, height: 50)
        
        stackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 20, right: rightAnchor, paddingRight: 20, centerX: self.centerXAnchor, centerY: self.centerYAnchor, width: 0, height: 200)
        
        signUpButton.anchor(top: stackView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: stackView.leftAnchor, paddingLeft: 0, right: stackView.rightAnchor, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 50)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.ivory.value
        label.text = "Join the Ravel"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 1, height: 1)
        
        return label
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.setupBackgroundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var userNameTxtField: UITextField = {
        let textField = UITextField.setUpTextField(with: "User name")
        
        return textField
    }()
    
    lazy var passwordTxtField: UITextField = {
        let textField = UITextField.setUpTextField(with: "Password")
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    
    lazy var emailTxtField: UITextField = {
        let textField = UITextField.setUpTextField(with: "Email address")

        return textField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameTxtField, emailTxtField, passwordTxtField])
        stackView.axis  = .vertical
        stackView.distribution  = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton.setUp()
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
}
