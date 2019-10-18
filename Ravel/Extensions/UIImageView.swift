//
//  UIImageView.swift
//  Ravel
//
//  Created by Krystyna Kruchkovska on 10/5/19.
//  Copyright © 2019 Krystyna Kruchkovska. All rights reserved.
//

import UIKit

extension UIImageView {
    static func setupBackgroundImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "initialImg"))
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
    
        return imageView
    }
    
     func downloadImage(from url: URL?){
        guard  let imageURl = url else {
                  return
              }
        URLSession.shared.dataTask(with: imageURl) { data, response, error in
            guard
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data)
                else {
                    return
                    
            }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
