//
//  TeamManager.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/7/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class TeamManager {
    static func setup() {
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = CustomColors.dark_purple.value
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        

        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
     
    }
}
