//
//  Colors.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

public enum CustomColors {
    case ivory
    case dark_purple
    case lemon
    case facebook
}

extension CustomColors {
    var value: UIColor {
        get {
            switch self {
            case .ivory:
                return UIColor(named: "ivory")!
            case .dark_purple:
                return UIColor(named: "dark_purple")!
            case .lemon:
                return UIColor(named: "lemon")!
            case .facebook:
                return UIColor(named: "facebook")!
            }
        }
    }
    
}
