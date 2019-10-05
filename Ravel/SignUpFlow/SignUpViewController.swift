//
//  SignUpViewController.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view = SignUpCustomView()
    }
    
    var customView: UIView {
        return view as! SignUpCustomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
