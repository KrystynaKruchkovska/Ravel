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
    
    init(dbService: UserDBService, storageService: StorageService) {
        self.dbService = dbService
        self.storageService = storageService
    }
    
    func editImage(dataReference: String = Constants.UserData.profileImg.rawValue(), newValue: String){
        dbService.changeUserData(dataReference: dataReference, newValue: newValue)
    }
}
