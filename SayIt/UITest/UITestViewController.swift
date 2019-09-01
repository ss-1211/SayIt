//
//  UITestViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/28.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit
import CircleMenu

class UITestViewController: UIViewController, CircleMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //サークルメニューUIボタン表示
        let button = CircleMenu(
            frame: CGRect(x: view.center.x-20, y: view.center.y, width: 50, height: 50),
            normalIcon:"Menu-btn2",
            selectedIcon:"close-btn2",
            buttonsCount: 4,
            duration: 1,
            distance: 100)
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        view.addSubview(button)

    }
    //アイコンの配列
    let items: [(icon: String, color: UIColor)] = [
        ("home-btn2-1", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("search-btn2", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("notifications-btn", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("settings-btn", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1)),
        ("nearby-btn2", UIColor(red: 1, green: 0.39, blue: 0, alpha: 1))
    ]
    
    //
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        switch atIndex {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeView") as! ViewController
            self.present(vc, animated: true, completion: nil)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            self.present(vc, animated: true, completion: nil)
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSetting") as! ProfileSettingViewController
            self.present(vc, animated: true, completion: nil)
            
        default:
            return
        }
    }
}
