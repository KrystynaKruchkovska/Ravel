//
//  SignInViewController.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

protocol SignInViewControllerDelegate {
    
    func signInPressed()
    func signUpPressed()
    func signUpWithFacebookSuccessed()
}

class SignInViewController: UIViewController {
    
    private var delegate: SignInViewControllerDelegate!
    private let viewModel: SignInViewModel!
    
    init(delegate: SignInViewControllerDelegate, viewModel: SignInViewModel) {
        self.delegate = delegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var customView: CustomView {
        return view as! CustomView
    }
    
    override func loadView() {
        super.loadView()
        self.view = CustomView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = CustomColors.dark_purple.value
        
        customView.signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchDown)
        
        customView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchDown)
        
         customView.signUpWithFacebook.addTarget(self, action: #selector(signInWithFacebookAction), for: .touchDown)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    @objc func signInButtonAction(){
        guard let userEmail = customView.userEmailTxtField.text,
        let userPassword = customView.passwordTxtField.text else {
            return
        }
        
        TextFieldInfoValidator.validateTextFieldInfo(in: self, inputs: [userEmail, userPassword]) { (isValid) in
            if isValid {
                self.viewModel.signIn(email: userEmail, password: userPassword) { (error, user) in
                    if let error = error {
                        AlertController.showAlert(self, title: "Ouch!", message: error.localizedDescription)
                    }
                    
                    if let user = user {
                        self.delegate.signInPressed()
                    }
                }
            }
        }
    }
    
    
    @objc func signUpButtonAction(){
        delegate.signUpPressed()
    }

    
    @objc func signInWithFacebookAction(){
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .success(granted: _, declined: _, token: _):
                print("success")
                self.viewModel.signInWithFaceBook { [weak self] (error, user) in
                    if let user = user {
                        self?.delegate.signUpWithFacebookSuccessed()
                    }
                    
                }
            case .failed(let error):
                print(error)
            case .cancelled:
                print("cancelled")
            }
        }
        
    }
    
}
