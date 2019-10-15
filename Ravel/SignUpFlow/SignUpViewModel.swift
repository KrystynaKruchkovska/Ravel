//
//  SignUpViewModel.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/8/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation

class SignUpViewModel {
    
    private var authService: AuthService
    private var dbService: UserDBService
    
    init(authService: AuthService, dbService: UserDBService) {
        self.authService = authService
        self.dbService = dbService
    }
    
    func createUser(nickname:String, email:String, password:String, handler:@escaping (_ error:Error?,_ user:CustomUser?) -> ()) {
        self.authService.createUser(nickname:nickname, email: email, password: password, handler: handler)
    }
    
    func sendVerificationEmail(user: CustomUser, handler: @escaping (_ error:Error?)->()) {
        self.authService.sendVerificationEmail(user: user, handler: handler)
    }
    
    func addUser(user: CustomUser, handler: @escaping (_ error:Error?)->()) {
        dbService.addUser(user: user, handler: handler)
    }
    
}
