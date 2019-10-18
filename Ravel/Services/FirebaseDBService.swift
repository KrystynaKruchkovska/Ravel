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
    var currentUser: CustomUser? { get }
    func addUser(user: CustomUser, handler: @escaping (_ error:Error?)->())
    func changeUserData(dataReference: String, newValue: Any)
    func userExists(user: CustomUser, handler: @escaping (_ userExists: Bool) -> ())
    func readUserProfileImage(_ imageStringUrl: @escaping(String?) -> ())
}

class FirebaseDBService: UserDBService {
    
    var currentUser: CustomUser? {
        if let currentUser = Auth.auth().currentUser {
            return FirebaseUser(withUser: currentUser)
        } else {
            return nil
        }
    }
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
        let userData:Dictionary<String, Any> = [Constants.UserData.provider.rawValue() : user.providerID, Constants.UserData.email.rawValue(): user.email, Constants.UserData.username.rawValue(): user.nickname, Constants.UserData.profileImg.rawValue(): user.profileImgUrl ?? ""]
        setUserValue(user: user.uid, userData: userData as Dictionary<String, AnyObject>, handler: handler)
    }
    
    func changeUserData(dataReference: String, newValue: Any) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let data = _REF_USERS.child(currentUser.uid)
        data.updateChildValues([dataReference:newValue])
    }
    
    func readUserProfileImage(_ imageStringUrl: @escaping(String?) -> ()){
        guard let userID = Auth.auth().currentUser?.uid else {
             
            imageStringUrl(nil)
            return
        }
        let ref = _REF_USERS.child(userID)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String:Any] {
                //Do not cast print it directly may be score is Int not string
                let profileImgUrl = value[Constants.UserData.profileImg.rawValue()] as? String
                imageStringUrl(profileImgUrl)
            }
        })
    }
    
    func userExists(user: CustomUser, handler: @escaping (_ userExists: Bool) -> ())  {
        _REF_BASE.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            handler(snapshot.hasChild(user.uid))
        })
    }
}
