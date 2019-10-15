//
//  StorageService.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/15/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit
import Firebase

protocol StorageService {
     func uploadImage(_ image: UIImage, completion: @escaping (_ url: String?) -> Void)
}

class FirebaseStorageService: StorageService {
    
    private let STORAGE_BASE = Storage.storage().reference()
    
    func uploadImage(_ image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = STORAGE_BASE.child("user/\(uid)")
        
        if let uploadData = image.pngData() {
            
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    completion(nil)
                } else {
                    storageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            return
                        }
                        completion(downloadURL.absoluteString)
                    }
                }
            }
        }
    }
}
