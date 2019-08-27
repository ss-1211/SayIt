//
//  UserPostCell.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPost: UILabel!
    @IBAction func handleComment(_ sender: UIButton) {
    
    }
    @IBOutlet weak var adminPost: UILabel!
    @IBOutlet weak var adminIcon: UIImageView!
    var tappedCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userIcon.layer.cornerRadius = 15
        userPost.layer.cornerRadius = 10
        userPost.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        adminPost.layer.cornerRadius = 15
        adminPost.backgroundColor = UIColor(red: 242/255, green: 237/255, blue: 115/255, alpha: 1)
        self.addSubview(UserBalloonView(frame: CGRect(x: userPost.frame.minX+10, y: userPost.frame.minY-18, width: 40, height: 30)))//吹き出しのようにするためにビューを重ねる
        self.addSubview(AdminBalloonView(frame: CGRect(x: adminPost.frame.maxX, y: userPost.frame.minY+60, width: 30, height: 30)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappped(_:)))
        userPost.addGestureRecognizer(tapGesture)
        userPost.isUserInteractionEnabled = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //セルへ配置
    func setUp(userIcon: UIImage, userName: String, userPost: String, adminPost: String?){
        self.userIcon.image = userIcon
        self.userName.text = userName
        self.userPost.text = userPost
        self.adminIcon.image = UIImage(named: "crazy")
//        self.adminPost.backgroundColor = .clear
        self.adminPost.text = ""
    }
    func setUpWithComment(userIcon: UIImage, userName: String, userPost: String, adminPost: String!){
        self.userIcon.image = userIcon
        self.userName.text = userName
        self.userPost.text = userPost
        self.adminIcon.image = UIImage(named: "crazy")
        self.adminPost.text = adminPost
    }
    @objc func tappped(_ sender: UITapGestureRecognizer) {
        let goodIcon = UIImage(named: "good3")
        let goodButton = UIButton(type: .system)
        goodButton.tag = 1
        let badIcon = UIImage(named: "good3")
        let badButton = UIButton(type: .system)
        badButton.tag = 2
        let blurEffect = UIBlurEffect(style: .extraLight)
        // ブラーエフェクトからエフェクトビューを作成
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.tag = 3
        
        if tappedCount == 0 {
            // エフェクトビューのサイズを画面に合わせる
            visualEffectView.frame = self.frame
            // エフェクトビューを初期viewに追加
            self.addSubview(visualEffectView)
            goodButton.setBackgroundImage(goodIcon, for: .normal)
            goodButton.frame = CGRect(x: userPost.frame.minX+100, y: userPost.frame.maxY-50, width: 50, height: 50)
            self.addSubview(goodButton)
            
            badButton.setBackgroundImage(badIcon, for: .normal)
            badButton.frame = CGRect(x: userPost.frame.minX+140, y: userPost.frame.maxY-80, width: 50, height: 50)
            self.addSubview(badButton)
            
            tappedCount += 1
            
        } else {
            let fetchedView1 = self.viewWithTag(1)
            let fetchedView2 = self.viewWithTag(2)
            let fetchedView3 = self.viewWithTag(3)
            fetchedView1!.removeFromSuperview()
            fetchedView2!.removeFromSuperview()
            fetchedView3!.removeFromSuperview()
            tappedCount = 0
        }
            
    }
        
    
}
