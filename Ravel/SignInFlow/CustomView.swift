//
//  CustomView.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CustomView: UIView {
    
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(frame:.zero)
        handleSignInBtnState()
        addSubview(imageView)
        addSubview(label)
        addSubview(stackView)
        
        imageView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, centerX: nil, centerY: nil,  width: 0, height: 0)
        
        stackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 20, right: rightAnchor, paddingRight: 20, centerX: self.centerXAnchor, centerY: self.centerYAnchor, width: 0, height: 300)
        
        label.anchor(top: self.topAnchor, paddingTop: 200, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: self.centerXAnchor, centerY: nil, width: 0, height: 50)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.setupBackgroundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CustomColors.ivory.value
        label.text = "Welcome to Ravel"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 1, height: 1)

        return label
    }()
    
    lazy var userEmailTxtField: UITextField = {
        let textField = UITextField.setUpTextField(with: "User email")
        
        return textField
    }()
    
    lazy var passwordTxtField: UITextField = {
        let textField = UITextField.setUpTextField(with: "Password")
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton.setUp()
        button.setBackgroundColor(.gray, for: .disabled)
        button.setBackgroundColor(CustomColors.lemon.value, for: .normal)
        button.isEnabled = false
        button.setTitle("Sign In", for: .normal)
        
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton.setUp()
        button.setBackgroundColor(CustomColors.lemon.value, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        
        return button
    }()
    
    lazy var signUpWithFacebook: UIButton = {
        let button = UIButton.setUp()
        button.setTitle("Continue with Facebook", for: .normal)
        button.backgroundColor = CustomColors.facebook.value
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userEmailTxtField, passwordTxtField, signInButton,signUpButton,signUpWithFacebook])
        stackView.axis  = .vertical
        stackView.distribution  = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private func handleSignInBtnState() {

        let emailValidation = userEmailTxtField
            .rx.text
            .map({!$0!.isEmpty})
            .share(replay: 1)

         let userPasswordValidation = passwordTxtField
            .rx.text
            .map({!$0!.isEmpty})
            .share(replay: 1)
        
        let _ = Observable.combineLatest(emailValidation, userPasswordValidation)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (validEmail, validPassword) in
            if validEmail && validPassword {
                self?.signInButton.isEnabled = true
            } else {
                self?.signInButton.isEnabled = false
                }
            }).disposed(by: disposeBag)
    }
}
