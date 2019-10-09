//
//  SignInViewModel.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/8/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation

class SignInViewModel {
    
    private var authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func signIn(email: String, password: String, handler: @escaping (_ error:Error?, _ user: CustomUser?) -> ()) {
        self.authService.signInUser(email: email, password: password, handler: handler)
    }
    
    func signInWithFaceBook(handler: @escaping (_ error:Error?, _ user: CustomUser?) -> ()) {
        self.authService.loginWithFacebook(handler: handler)
    }
}
