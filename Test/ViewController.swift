//
//  ViewController.swift
//  Test
//
//  Created by bo on 16/1/24.
//  Copyright © 2016年 huami. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let URLStrings = ["http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan.jpg","http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-001.jpg","http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-002.jpg","http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-003.jpg","http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-004.jpg","http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-005.jpg"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
//        imageView.("http://img.ivsky.com/img/tupian/t/201511/03/xiatian_de_caoyuan-003.jpg")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: false)
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            Toast.show("Toast in Bottom",  position: .bottom)
        case (0,1):
            Toast.show("Toast in Center",  position: .center)
        case (1,0):
            HUD.showLoading("HUD Loading")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                HUD.hide()
            }
        case (1,1):
            HUD.showSuccess("HUD Success")
        case (1,2):
            HUD.showError("HUD Failure")
        case (3,0):
            navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: "TestNavViewController"))!, animated: true)
        case (3,1):
            ImageBrowser.show(image: UIImage(named: "背景"))
        default: break
        }
    }

}

