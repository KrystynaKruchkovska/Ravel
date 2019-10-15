//
//  FirebaseDBService.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/14/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation
import Firebase

protocol UserDBService {
    func addUser(user: CustomUser, handler: @escaping (_ error:Error?)->())
    func changeUserData(dataReference: String, newValue: Any)
}

class FirebaseDBService: UserDBService {
    public private (set) var currentUser = Auth.auth().currentUser
    private static let DB_BASE = Database.database().reference()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    private func setUserValue(user uid: String, userData: Dictionary<String, AnyObject>, handler: @escaping (_ error: Error?) -> ()) {
        _REF_USERS.child(uid).setValue(userData) {
            (error: Error?, ref: DatabaseReference) in
            if let error = error {
                handler(error)
            } else {
                handler(nil)
            }
        }
    }
    
    func addUser(user: CustomUser, handler: @escaping (_ error:Error?)->()){
        let userData:Dictionary<String, Any> = [Constants.UserData.provider.rawValue() : user.providerID, Constants.UserData.email.rawValue(): user.email, Constants.UserData.username.rawValue(): user.nickname, Constants.UserData.profileImg.rawValue(): ""]
        setUserValue(user: user.uid, userData: userData as Dictionary<String, AnyObject>, handler: handler)
    }
    
    func changeUserData(dataReference: String, newValue: Any) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let data = _REF_USERS.child(currentUser.uid).child(dataReference)
        data.setValue(newValue)
    }
}
