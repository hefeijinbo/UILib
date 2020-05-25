//
//  Toast.swift
//  Test
//
//  Created by jinbo on 16/2/14.
//  Copyright © 2016年 huami. All rights reserved.
//

import UIKit

public class Toast: UIView {
    
    //MARK: public
    @objc public enum ToastPosition: Int {
        case bottom
        case center
    }

    @objc public static func show(_ title: String) {
        show(title, position: .bottom)
    }
    
    @objc public static func show(_ title:String, position:ToastPosition) {
        guard let inView = UIApplication.shared.keyWindow else {
            return
        }
        for subview in inView.subviews {
            if let subview = subview as? Toast {
                subview.hide()
            }
        }
        if let toast = Bundle(for: Toast.self).loadNibNamed("Toast", owner: nil, options: nil)?.first as? Toast {
            toast.configureToast(title: title, inView: inView, position: position)
        }
    }
    
    //MARK: private
    private func configureToast(title: String, inView: UIView, position:ToastPosition) {
        labelTitle.text = title
        var ratio:CGFloat = 1.2 //iPad1.5倍缩放
        if UIDevice.current.userInterfaceIdiom != .pad {
            ratio =  min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) / 375.0//相对于iPhone 6的比例
        }
        constraintTop.constant = 16 * ratio
        constraintBottom.constant = 16 * ratio
        constraintLeading.constant = 13.7 * ratio
        constraintTrailing.constant = 13.7 * ratio
        layer.cornerRadius = 9 * ratio
        
        inView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1
        }
        inView.addConstraint(NSLayoutConstraint(item: inView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .width, multiplier: 1, constant: 104.0 * ratio))
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .width, multiplier: 1, constant: 203.0 * ratio))
        
        if position == .bottom {
            inView.addConstraint(NSLayoutConstraint(item: inView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant:112 * ratio))
        } else {
            inView.addConstraint(NSLayoutConstraint(item: inView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant:0))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hide()
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    @IBOutlet private var viewBg:UIView!
    @IBOutlet private var labelTitle:UILabel!
    @IBOutlet private var constraintTop:NSLayoutConstraint!
    @IBOutlet private var constraintBottom:NSLayoutConstraint!
    @IBOutlet private var constraintLeading:NSLayoutConstraint!
    @IBOutlet private var constraintTrailing:NSLayoutConstraint!

}
