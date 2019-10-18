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
        setProfileImage()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        customView.imagePickerButton.addTarget(self, action: #selector(showImagePicker), for: .touchDown)
        
        customView.logOutButton.addTarget(self, action: #selector(onLogout), for: .touchDown)
        

        // Do any additional setup after loading the view.
    }
    
    private var customView: ProfileView {
        return view as! ProfileView
    }

    @objc func onLogout() {
        viewModel.logOut()
    }
    @objc func showImagePicker()  {
        self.imagePicker.present(from: self.view)
    }
    
    private func setProfileImage() {
        if viewModel.dbService.currentUser != nil {
            viewModel.dbService.readUserProfileImage { (stringUrl) in
                if let stringUrl = stringUrl, let url = URL(string: stringUrl) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        let image = UIImage(data: data!)
                        DispatchQueue.main.async {
                            self.customView.userImageView.image = image
                            self.viewModel.storageService.uploadImage(image!) { (imageUrlString) in
                                if let imageUrlString = imageUrlString {
                                    self.viewModel.editImage(newValue: imageUrlString)
                                }
                            }
                        }
                    }
                }
            }
        
        } else {
             customView.userImageView.image = UIImage (imageLiteralResourceName: "initialImg")
        }
        
    }
    

}

extension UserProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        customView.userImageView.image = image
        if let image = image {
            viewModel.storageService.uploadImage(image) { (imageUrlString) in
                if let imageUrlString = imageUrlString {
                    self.viewModel.editImage(newValue: imageUrlString)
                }
            }
        }
    }
    
    
}
