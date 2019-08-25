//
//  FeedData.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class UserPost: NSObject{
    let id: String
    let userIcon: UIImage
    let userName : String
    let userPostContent: String
    let adminIcon: UIImage
    let adminPostContent: String?
    let adminExist: AdminExist
    
    public init(id:String, userIcon: UIImage, userName: String, userPostContent: String, adminIcon: UIImage, adminPostContent: String?, adminExist: AdminExist){
        self.id = id
        self.userIcon = userIcon
        self.userName = userName
        self.userPostContent = userPostContent
        self.adminIcon = adminIcon
        self.adminPostContent = adminPostContent
        self.adminExist = adminExist
    }
    public func isAdminExist() -> Bool {
        return adminExist == .Y
    }
}

//class AdminPost: NSObject {
//    let id: String
//    let adminIcon: UIImage
//    let adminPostContent: String?
//    let adminExist: AdminExist
//
//    public init (id: String, adminIcon: UIImage, adminPostContent: String?, adminExist: AdminExist){
//        self.id = id
//        self.adminIcon = adminIcon
//        self.adminPostContent = adminPostContent
//        self.adminExist = adminExist
//    }
//

//}

public enum AdminExist {
    case Y
    case N
}
