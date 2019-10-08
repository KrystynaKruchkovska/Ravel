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
        runSignInVC()
    }
    
    private func runSignInVC() {
        let vc = SignInViewController(delegate: self, viewModel: SignInViewModel(authService: FirebaseAuthService()))
        //vc.modalPresentationStyle = .fullScreen
        rootViewController?.show(vc, sender: nil)
    }
    
    private func runSignUpVC() {
        let vc = SignUpViewController(viewModel: SignUpViewModel(authService: FirebaseAuthService()))
        rootViewController?.show(vc, sender: nil)
    }
    
    private func runMainVC() {
        let vc = MainController()
        rootViewController?.show(vc, sender: nil)
    }
    
}



extension AppFlowCoordinator: SignInViewControllerDelegate {
    func signInPressed() {
        runMainVC()
        print("signInPressed")
    }
    
    func signUpPressed() {
        runSignUpVC()
    }
    
    func signUpWithFacebookPressed() {
        print("signUpWithFacebookPressed")
    }
    
    
}
