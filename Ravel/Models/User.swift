//
//  User.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/4/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation
import Firebase

protocol CustomUser {
    var email: String { get }
    var nickname: String { get }
    var uid: String { get }
    var providerID: String { get }
    var isEmailVerified: Bool { get }
    
    func sendEmailVerification(completion: @escaping (Error?) -> ())
}



class FirebaseUser : CustomUser {

    let user: User
    var _nickname: String
    
    init(withUser user: User, nickname: String = "") {
        self.user = user
        self._nickname = nickname
    }
    
    var uid: String {
        get { return self.user.uid }
    }

    var providerID: String  {
        get { return self.user.providerID }
    }
    
    var email: String  {
        get { return self.user.email ?? "" }
    }
    
    var nickname: String  {
        get {
            if self._nickname != "" {
                return self._nickname
            } else {
                return self.user.displayName ?? ""
            }
        }
    }
    
    var isEmailVerified: Bool  {
        get { return self.user.isEmailVerified }
    }
    
    func sendEmailVerification(completion: @escaping (Error?) -> ()) {
        self.user.sendEmailVerification(completion: completion)
    }
}

