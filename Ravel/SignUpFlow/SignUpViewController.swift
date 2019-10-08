//
//  SignUpViewController.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = SignUpCustomView()
    }
    
    var customView: SignUpCustomView {
        return view as! SignUpCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.signUpButton.addTarget(self, action: #selector(onSignUpPressed), for: .touchDown)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func onSignUpPressed() {
        guard let userName = customView.userNameTxtField.text,
            let userEmail = customView.emailTxtField.text, let userPassword = customView.passwordTxtField.text else {
                return
        }
        
        TextFieldInfoValidator.validateTextFieldInfo(in: self, inputs: [userName, userEmail, userPassword]) { (isValid) in
            if isValid {
                self.viewModel.createUser(nickname: userName, email: userEmail, password: userPassword) { (error, user) in
                    if let error = error {
                        AlertController.showAlert(self, title: "Ouch!", message: error.localizedDescription)
                    }
                }
            }
            
        }
        
    }
}
