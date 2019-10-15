//
//  FirebaseAuthService.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/7/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation
import Firebase
import FacebookLogin
import FacebookCore


class FirebaseAuthService: AuthService {

    
    func loginWithFacebook(handler: @escaping (Error?, CustomUser?) -> ()) {
        
        if let accessToken = AccessToken.current?.tokenString {
           
            let credentials = FacebookAuthProvider.credential(withAccessToken: accessToken)
            Auth.auth().signIn(with: credentials) { (dataResult, error) in
                if let error = error {
                    handler(error, nil)
                    return
                }
                guard let user = dataResult?.user else {
                    return
                }
                
                handler(nil, FirebaseUser(withUser: user))
            }
        }

    }
    
    
    
    
    func resetPassword(email: String, handler: @escaping (_ error: Error?) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil{
                print("create user error: \(String(describing: error))")
                handler(error)
                return
            }
            
            handler(nil)
        }
    }
    
    
    func createUser(nickname: String, email: String, password: String, handler: @escaping (_ error: Error?,_ user: CustomUser?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                print("create user error: \(error)")
                handler(error, nil)
                
                return
            }
            
            guard let user = authResult?.user else {
                handler(error, nil)
                return
            }
            
            handler(nil, FirebaseUser(withUser: user, nickname: nickname))
        }
        
    }
    
    func sendVerificationEmail(user:CustomUser, handler:@escaping (_ error:Error?)->()){
        user.sendEmailVerification(completion: { error in
            if let error = error {
                print(error.localizedDescription)
                handler(error)
                return
            }
            print("Check your email for link")
            handler(nil)
            
        })
    }
    
    
    func signInUser(email:String,password:String, handler:@escaping (_ error:Error?, _ user:CustomUser?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                handler(error, nil)
                return
            }
            
            guard let user = user?.user else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Internal error"])
                handler(error, nil)
                return
            }
            
            handler(nil, FirebaseUser(withUser: user))
        }
    }
    
}
