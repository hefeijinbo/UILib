//
//  TestNavViewController.swift
//  Test
//
//  Created by jinbo on 2018/6/22.
//  Copyright © 2018年 huami. All rights reserved.
//

import UIKit

class TestNavViewController: UIViewController {

    @IBOutlet weak var navigationView: NavigationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NavigationView.BGColor = UIColor.red
//        NavigationView.TitleColor = UIColor.white
//        NavigationView.ButtonColor = UIColor.white

        navigationView.backgroundColor = NavigationView.BGColor
        navigationView.setTitle("测试", color: NavigationView.TitleColor)
        navigationView.setLeftButtonImage(NavigationView.ArrowImage, target: self, action: #selector(backAction))
        navigationView.setRightButtonImage(NavigationView.AddImage, target: self, action: #selector(backAction))
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
