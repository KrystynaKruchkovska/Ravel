//
//  UserProfileViewController.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/9/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    private var viewModel: UserProfileViewModel
    private var imagePicker: ImagePicker!
    
    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        customView.imagePickerButton.addTarget(self, action: #selector(showImagePicker), for: .touchDown)
        

        // Do any additional setup after loading the view.
    }
    
    private var customView: ProfileView {
        return view as! ProfileView
    }

    @objc func showImagePicker()  {
        self.imagePicker.present(from: self.view)
    }
    

}

extension UserProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        customView.userImageView.image = image
        if let image = image,
            let imgData = image.pngData() {
            viewModel.storageService.uploadImage(image) { (imageUrlString) in
                if let imageUrlString = imageUrlString {
                    self.viewModel.editImage(newValue: imageUrlString)
                }
            }
        }
    }
    
    
}
