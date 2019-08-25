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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userIcon.layer.cornerRadius = 15
        userPost.layer.cornerRadius = 30
        adminPost.layer.cornerRadius = 15
        self.addSubview(UserBalloonView(frame: CGRect(x: userPost.frame.minX, y: userPost.frame.minY, width: 50, height: 50)))//吹き出しのようにするためにビューを重ねる

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
        self.adminPost.backgroundColor = .clear
        self.adminPost.text = ""
    }
    func setUpWithComment(userIcon: UIImage, userName: String, userPost: String, adminPost: String!){
        self.userIcon.image = userIcon
        self.userName.text = userName
        self.userPost.text = userPost
        self.adminIcon.image = UIImage(named: "crazy")
        self.adminPost.text = adminPost
    }
}
