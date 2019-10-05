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
    var rootViewController: UIViewController?
}

class AppFlowCoordinator: Coordinator {
    
    private var window: UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func initApp() {
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        runRegistrationVC()
    }
    
    private func runRegistrationVC() {
        let vc = RegistrationViewController(delegate: self)
        //vc.modalPresentationStyle = .fullScreen
        rootViewController?.show(vc, sender: true)
    }
    
    private func runSignUpVC() {
        let vc = SignUpViewController()
        //vc.modalPresentationStyle = .fullScreen
        rootViewController?.show(vc, sender: true)
    }
    
}



extension AppFlowCoordinator: RegistrationViewControllerDelegate {
    func signInPressed() {
        print("signInPressed")
    }
    
    func signUpPressed() {
        print("signUpPressed")
        runSignUpVC()
    }
    
    func signUpWithFacebookPressed() {
        print("signUpWithFacebookPressed")
    }
    
    
}
