//
//  HUD.swift
//  Test
//
//  Created by bo on 16/1/24.
//  Copyright © 2016年 huami. All rights reserved.
//

import UIKit

public class HUD: UIView {
    
    //MARK: - public
    @discardableResult
    @objc public static func showLoading(_ title: String) -> HUD {
        if let hud = existHUD, hud.type == .loading {
            hud.reload(type: .loading, title: title)
            return hud
        }
        let hud = bundle.loadNibNamed("HUD", owner: nil, options: nil)?.first as! HUD
        hud.addToWindow()
        hud.reload(type: .loading, title: title)
        return hud
    }

    @discardableResult
    @objc public static func showSuccess(_ title: String) -> HUD {
        if let hud = existHUD {
            hud.reload(type: .success, title: title)
            return hud
        }
        let hud = bundle.loadNibNamed("HUD", owner: nil, options: nil)?.first as! HUD
        hud.addToWindow()
        hud.reload(type: .success, title: title)
        return hud
    }
    
    @discardableResult
    @objc public static func showError(_ title: String) -> HUD {
        if let hud = existHUD {
            hud.reload(type: .failure, title: title)
            return hud
        }
        let hud = bundle.loadNibNamed("HUD", owner: nil, options: nil)?.first as! HUD
        hud.addToWindow()
        hud.reload(type: .failure, title: title)
        return hud
    }
    
    static var existHUD: HUD? {
        guard let superView = UIApplication.shared.keyWindow else {
            return nil
        }
        for view in superView.subviews {
            if let view = view as? HUD {
                return view
            }
        }
        return nil
    }
    
    @objc public static func hide() {
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                if let view = view as? HUD {
                    view.hide()
                }
            }
        }
    }
    
    //MARK: - private
    private enum HUDType:String {
        case loading = "loading_hud" //需要手动调用 hide 方法关闭
        case success = "success_hud"
        case failure = "failure_hud" //自动关闭
    }
    
    private static let bundle = Bundle(for: HUD.self)
    
    private func hide() {
        imageView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    func addToWindow() {
        guard let superView = UIApplication.shared.keyWindow else {
            return
        }
        var ratio:CGFloat = 1.5 //iPad1.5倍缩放
        if UIDevice.current.userInterfaceIdiom != .pad {
            ratio = UIScreen.main.bounds.size.width / 375.0//相对于iPhone 6的比例
        }
        viewContainer.layer.cornerRadius = 9 * ratio
        constraintImageViewTop.constant = 14 * ratio
        constraintTitleBottom.constant = 14 * ratio
        constraintLabelTitleTop.constant = 9.6 * ratio
        constraintLabelTitleLeading.constant = 20.6 * ratio
        constraintLabelTitleTrailing.constant = 20.6 * ratio
        constraintLabelTitleMinWidth.constant = 63 * ratio
        constraintLabelTitleMaxWidth.constant = 160 * ratio
        constraintImageViewWidth.constant = 52 * ratio
        labelTitle.font = UIFont.systemFont(ofSize: 13 * ratio)
        
        superView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: 0))
        superView.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 0))
        superView.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 0))
        superView.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom , relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: 0))
        
        alpha = 0
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1
        }
    }
    
    private var type = HUDType.loading
    
    private func reload(type:HUDType,title:String) {
        self.type = type
        imageView.image = UIImage(named: type.rawValue, in: HUD.bundle, compatibleWith: nil)
        labelTitle.text = title
        if (type == .loading) {
            if imageView.layer.animation(forKey: "rotation") == nil {
                let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
                rotation.toValue = Double.pi * 2
                rotation.duration = 1.2
                rotation.repeatCount = MAXFLOAT
                rotation.isRemovedOnCompletion = false
                imageView.layer.add(rotation, forKey: "rotation")
            }
            isUserInteractionEnabled = true
        } else {// 2s后移除
            imageView.layer.removeAnimation(forKey: "rotation")
            isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.hide()
            }
        }
    }
    
    //MARK: - IBOutlet -
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var constraintImageViewTop: NSLayoutConstraint!
    @IBOutlet private weak var constraintLabelTitleTop: NSLayoutConstraint!
    @IBOutlet private weak var constraintTitleBottom: NSLayoutConstraint!
    @IBOutlet private weak var constraintImageViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var constraintLabelTitleTrailing: NSLayoutConstraint!
    @IBOutlet private weak var constraintLabelTitleLeading: NSLayoutConstraint!
    @IBOutlet private weak var constraintLabelTitleMinWidth: NSLayoutConstraint!
    @IBOutlet private weak var constraintLabelTitleMaxWidth: NSLayoutConstraint!
}
