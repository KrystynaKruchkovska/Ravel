//
//  AppFlowCoordinator.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class Coordinator {
    var next: Coordinator?
    var rootController: UIViewController?
}

class AppFlowCoordinator: Coordinator {
    
    private var window: UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func initApp() {
        rootController = RegistrationViewController()
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
    
}
