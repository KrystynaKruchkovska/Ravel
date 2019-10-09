//
//  AuthServise.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/7/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation

protocol AuthService {
    
    func createUser(nickname: String, email: String, password:String, handler:@escaping (_ error:Error?,_ user:CustomUser?) -> ())
    
    func sendVerificationEmail(user:CustomUser, handler:@escaping (_ error: Error?)->())
    
    func signInUser(email: String, password: String, handler:@escaping (_ error: Error?,_ user:CustomUser?) -> ())
    
    func resetPassword(email: String, handler: @escaping (_ error: Error?) -> ())
    
    func loginWithFacebook( handler: @escaping (_ error:Error?,_ user: CustomUser?) -> ())
}
