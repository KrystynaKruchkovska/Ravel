
//
//  ProfileView.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/10/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    init() {
        super.init(frame: .zero)
        self.addSubview(backgroundImageView)
        self.addSubview(userImageView)
        self.addSubview(imagePickerButton)
        
        backgroundImageView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, centerX: nil, centerY: nil,  width: 0, height: 0)
        userImageView.anchor(top: topAnchor, paddingTop: 100, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: centerXAnchor, centerY: nil, width: 80, height: 80)
        imagePickerButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: userImageView.centerXAnchor, centerY: userImageView.centerYAnchor, width: 80, height: 80)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imagePickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.image = UIImage (imageLiteralResourceName: "initialImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView.setupBackgroundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
