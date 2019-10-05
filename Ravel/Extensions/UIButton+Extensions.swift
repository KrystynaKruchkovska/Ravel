//
//  UIButton+Extensions.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

extension UIButton {
    static func setUp() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.backgroundColor = CustomColors.lemon.value
        return button
    }
}
