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
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
