//
//  UserProfileViewModel.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/15/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import Foundation

class UserProfileViewModel {
    
    let dbService: UserDBService
    let storageService: StorageService
    let authService: AuthService
    
    init(dbService: UserDBService, storageService: StorageService, authService: AuthService) {
        self.dbService = dbService
        self.storageService = storageService
        self.authService = authService
    }
    
    func editImage(newValue: String){
        let dataReference = Constants.UserData.profileImg.rawValue()
        dbService.changeUserData(dataReference: dataReference, newValue: newValue)
    }
    
    func logOut(){
        authService.logOut()
    }
}
