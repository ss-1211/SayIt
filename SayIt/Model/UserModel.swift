//
//  UserModel.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/28.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class User:NSObject {
    let userId : String
    let userName: String
    let userIcon: UIImage
    let introduction: String
    let boke: Int
    let tsukkomi: Int
    
    init(userId: String, userName: String, userIcon:UIImage, introduction: String, boke: Int, tsukkomi: Int){
        self.userId = userId
        self.userName = userName
        self.userIcon = userIcon
        self.introduction = introduction
        self.boke = boke
        self.tsukkomi = tsukkomi
    }
    
}
