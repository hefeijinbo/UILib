//
//  HMNavigationView.swift
//  PSS
//
//  Created by jinbo on 2018/6/9.
//  Copyright © 2018年 mi. All rights reserved.
//

import UIKit

public class NavigationView: UIView {
    @objc public func setTitle(_ title: String, color: UIColor) {
        titleLabel.text = title
        titleLabel.textColor = color
    }
    
    @objc public func setLeftButtonTitle(_ title: String, titleColor: UIColor, target: Any, action: Selector) {
        leftButton.setImage(nil, for: .normal)
        leftButton.setTitle(title, for: .normal)
        leftButton.setTitleColor(titleColor, for: .normal)
        leftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc public func setLeftButtonImage(_ image: UIImage, target: Any, action: Selector) {
        leftButton.setImage(image, for: .normal)
        leftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc public func setRightButtonImage(_ image: UIImage, target: Any, action: Selector) {
        rightButton.setImage(image, for: .normal)
        rightButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc public func setRightButtonTitle(_ title: String, titleColor: UIColor, target: Any, action: Selector) {
        rightButton.setTitle(title, for: .normal)
        rightButton.setTitleColor(titleColor, for: .normal)
        rightButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc public func setRightButton2Title(_ title: String, titleColor: UIColor, target: Any, action: Selector) {
        rightButton2.setTitle(title, for: .normal)
        rightButton2.setTitleColor(titleColor, for: .normal)
        rightButton2.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc public func setRightButton2Image(_ image: UIImage, target: Any, action: Selector) {
        rightButton2.setImage(image, for: .normal)
        rightButton2.addTarget(target, action: action, for: .touchUpInside)
    }
    
    required public override init(frame: CGRect) {
        super.init(frame: frame)
        let view = Bundle(for: NavigationView.self).loadNibNamed("NavigationView", owner: self, options: nil)?.first as! UIView
        fillSubView(view)
        sendSubviewToBack(view)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = Bundle(for: NavigationView.self).loadNibNamed("NavigationView", owner: self, options: nil)?.first as! UIView
        fillSubView(view)
        sendSubviewToBack(view)
    }
    
    @IBOutlet public weak var lineView: UIView!
    @objc @IBOutlet public weak var titleLabel: UILabel!
    @objc @IBOutlet public weak var subTitleLabel: UILabel!
    @objc @IBOutlet public weak var leftButton: UIButton!
    @objc @IBOutlet public weak var rightButton: UIButton!
    @objc @IBOutlet public weak var rightButton2: UIButton!
    @objc @IBOutlet public var height: NSLayoutConstraint!

    public override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 11.0, *) {
            if let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom, bottom > 0 {
                height?.constant = 64 + 24
            }
        }
    }
}

extension UIView {
    func fillSubView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: .alignAllBottom, metrics: nil, views: ["view": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: .alignAllBottom, metrics: nil, views: ["view": view]))
    }
}
