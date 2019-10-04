//
//  CustomView.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    init() {
        super.init(frame:.zero)
        addSubview(imageView)
        addSubview(label)
        addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 200),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 300),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 200)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "initialImg"))
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
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
    
    lazy var signInButton: UIButton = {
        let button = setUpButton()
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = setUpButton()
        button.setTitle("Sign Up", for: .normal)
        return button
    }()
    
    lazy var signUpWithFacebook: UIButton = {
        let button = setUpButton()
        button.setTitle("Continue with Facebook", for: .normal)
        button.backgroundColor = CustomColors.facebook.value
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInButton,signUpButton,signUpWithFacebook])
        stackView.axis  = .vertical
        stackView.distribution  = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    private func setUpButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.backgroundColor = CustomColors.lemon.value
        return button
    }
}
