//
//  UITextField+Extensions.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

extension UITextField {
    
    static func setUpTextField(with placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = CustomColors.dark_purple.value
        textField.backgroundColor = CustomColors.ivory.value
        textField.layer.cornerRadius = 6
        textField.layer.masksToBounds = true

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.paragraphStyle: paragraphStyle])
        // Create a padding view for padding on left
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        
        return textField
    }
    
}

