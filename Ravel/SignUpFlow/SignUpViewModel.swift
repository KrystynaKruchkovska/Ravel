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
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(nickname:String, email:String, password:String, handler:@escaping (_ error:Error?,_ user:CustomUser?) -> ()) {
        self.authService.createUser(nickname:nickname, email: email, password: password, handler: handler)
    }
    
}
