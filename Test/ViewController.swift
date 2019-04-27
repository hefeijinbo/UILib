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
    }
//        switch (indexPath.section,indexPath.row) {
//        case (0,0):
//            Toast.show("Toast in Bottom",  position: .bottom)
//        case (0,1):
//            Toast.show("Toast in Center",  position: .center)
//        case (1,0):
//            HUD.showLoading("HUD Loading")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                HUD.hide()
//            }
//        case (1,1):
//            HUD.showSuccess("HUD Success")
//        case (1,2):
//            HUD.showError("HUD Failure")
//        case (2,0):
//            let tip = Tip.showLoading("Tip Loading", detail: "detail", inTable: tableView)
//            tip.addRightButton(title: "点我关闭") {
//                Tip.hideTip(inTable: self.tableView)
//            }
//        case (2,1):
//            let tip = Tip.showSuccess("Tip Success", detail: "detail", inTable: tableView)
//            tip.addRightButton(title: "点我关闭") {
//                Tip.hideTip(inTable: self.tableView)
//            }
//        case (2,2):
//            let tip = Tip.showError("Tip Failure", detail: "detail", inTable: tableView)
//            tip.addRightButton(title: "点我关闭") {
//                Tip.hideTip(inTable: self.tableView)
//            }
//        case (2,3):
//            let tip = Tip.showWarning("Tip Warning", detail: "detail", inTable: tableView)
//            tip.addRightButton(title: "点我关闭") {
//                Tip.hideTip(inTable: self.tableView)
//            }
//        case (3,0):
//            navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: "TestNavViewController"))!, animated: true)
//        case (3,1):
//            ImageBrowser.show(image: UIImage(named: "背景"))
//        case (3,2):
//            let titles = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
//            let selectIndex = 3
//            let unit = "天"
//            let picker = Picker.show(title: "当前\(titles[selectIndex])天", itemsTitle: titles, selectItemIndex: selectIndex, itemUnit: unit)
//            picker.addButton(title: "取消", action: nil)
//            picker.addButton(title: "确认") { (row) in
//                print(row)
//            }
//            picker.selectItemAction = {(row) in
//                picker.title = "当前\(titles[row])天"
//            }
//        case (3,3):
//            let view = UIView()
//            view.backgroundColor = UIColor.red
//            let picker = Picker.show(view: view, title: " 今天天气不错")
//            picker.addButton(title: "取消", action: nil)
//            picker.addButton(title: "确认") { (row) in
//            }
//        default: break
//        }
//    }
        
}

