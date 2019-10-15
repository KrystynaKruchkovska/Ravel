//
//  MainController.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/8/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
    
    private var userProfileViewModel: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileViewModel = userProfileVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUPTabBarController() {
        self.tabBar.tintColor = CustomColors.dark_purple.value
          let firstVc = UserProfileViewController(viewModel: userProfileViewModel)
          firstVc.title = "Profile"
          let secondVc = UIViewController()
          secondVc.title = "Second"
          self.viewControllers = [firstVc, secondVc]
      }

    override func viewDidLoad(){
        super.viewDidLoad()
        setUPTabBarController()
        //view.backgroundColor = .yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
