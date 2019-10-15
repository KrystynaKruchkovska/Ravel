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
    
    private let authService: AuthService
    private let dbService: UserDBService
    private let storageService: StorageService
    
    private var window: UIWindow
    
    init(window:UIWindow) {
        self.window = window
        self.authService = FirebaseAuthService()
        self.dbService = FirebaseDBService()
        self.storageService = FirebaseStorageService()
    }
    
    func initApp() {
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        runSignInVC()
    }
    
    private func runSignInVC() {
        let vc = SignInViewController(delegate: self, viewModel: SignInViewModel(authService: self.authService))
        //vc.modalPresentationStyle = .fullScreen
        rootViewController?.show(vc, sender: nil)
    }
    
    private func runSignUpVC() {
        let vc = SignUpViewController(viewModel: SignUpViewModel(authService: self.authService, dbService: self.dbService), delegate: self)
        rootViewController?.show(vc, sender: nil)
    }
    
    private func runMainVC() {
        let vc = MainController(userProfileVM: UserProfileViewModel(dbService: self.dbService, storageService: storageService))
        rootViewController?.show(vc, sender: nil)
    }
    
}


extension AppFlowCoordinator: SignInViewControllerDelegate {
    func signInPressed() {
        runMainVC()
    }
    
    func signUpPressed() {
        runSignUpVC()
    }
    
    func signUpWithFacebookSuccessed() {
        runMainVC()
    }
    
}

extension AppFlowCoordinator: SignUpViewControllerDelegate {
    func userCreatedSuccessfully() {
        runMainVC()
    }
}
