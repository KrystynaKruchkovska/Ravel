//
//  SignInViewModel.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/8/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class SignInViewModel {
    
    private var authService: AuthService
    private var dbService: UserDBService
    private var storageService: StorageService
    
    init(authService: AuthService, dbService: UserDBService, storageService: StorageService) {
        self.authService = authService
        self.dbService = dbService
        self.storageService = storageService
    }
    
    func signIn(email: String, password: String, handler: @escaping (_ error:Error?, _ user: CustomUser?) -> ()) {
        self.authService.signInUser(email: email, password: password, handler: handler)
    }
    
    func loginWithFacebook(handler: @escaping (_ error:Error?, _ user: CustomUser?) -> ()) {
        self.authService.loginWithFacebook(handler: handler)
    }
    
    func addUser(user: CustomUser, handler: @escaping (_ error:Error?)->()) {
        dbService.addUser(user: user, handler: handler)
    }
    
    func userExists(user: CustomUser, handler:  @escaping (_ userExists: Bool) -> ()) {
        dbService.userExists(user: user, handler: handler)
    }
    
    func editImage(newValue: String){
        let dataReference = Constants.UserData.profileImg.rawValue()
        dbService.changeUserData(dataReference: dataReference, newValue: newValue)
    }
    
    func uploadImage(_ image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        storageService.uploadImage(image, completion: completion)
    }
    
}
