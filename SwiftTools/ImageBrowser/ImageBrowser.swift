//
//  PhoneBrowserController.swift
//  Book
//
//  Created by jinbo on 16/1/4.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

public class ImageBrowser: UIImageView {
    
    @objc public static func show(image: UIImage?) {
        let mainWindow = UIApplication.shared.keyWindow ?? UIWindow()
        let imageBrowser = ImageBrowser()
        imageBrowser.image = image
        imageBrowser.contentMode = .scaleAspectFit
        mainWindow.fillSubView(imageBrowser)
        imageBrowser.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            imageBrowser.alpha = 1
        }) { (result) in
            imageBrowser.alpha = 1
            imageBrowser.isUserInteractionEnabled = true
        }
        imageBrowser.addGestureRecognizer(UITapGestureRecognizer(target: imageBrowser, action: #selector(ImageBrowser.click)))
        imageBrowser.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    @objc func click() {
        alpha = 1
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (result) in
            self.alpha = 0
            self.removeFromSuperview()
        }
    }
}
