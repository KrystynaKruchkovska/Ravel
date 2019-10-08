//
//  TextFieldInfoValidator.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/8/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class TextFieldInfoValidator {
    static func validateTextFieldInfo(in viewController: UIViewController, inputs:[String], completion: @escaping (_ isValid: Bool) -> ()) {
        for input in inputs {
            if input == "" {
                AlertController.showAlert(viewController, title: "Missing Info", message: "Please fill out all fields")
                completion(false)
                return
            }
        }
        completion(true)
    }
}
