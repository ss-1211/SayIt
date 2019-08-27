//
//  FeedData.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

//ユーザー投稿データ+コメントデータ
class TableData: NSObject{
    var userPost: UserPost?
    var commentPost: CommentPost?
}

//ユーザー投稿データ
class UserPost: NSObject{
    let id: String
    let userIcon: UIImage
    let userName : String
    let userPostContent: String
    let adminIcon: UIImage
    let adminPostContent: String?
    let type: String
    let adminExist: AdminExist
    
    public init(id:String, userIcon: UIImage, userName: String, userPostContent: String, adminIcon: UIImage, adminPostContent: String?, adminExist: AdminExist){
        self.id = id
        self.userIcon = userIcon
        self.userName = userName
        self.userPostContent = userPostContent
        self.adminIcon = adminIcon
        self.adminPostContent = adminPostContent
        self.adminExist = adminExist
        self.type = "Post"
    }
    public func isAdminExist() -> Bool {
        return adminExist == .Y
    }
}

//コメントデータ
class CommentPost: NSObject{
    let id: String
    let userIcon: UIImage
    let userName : String
    let comment: String
    let type: String
    
    public init(id:String, userIcon: UIImage, userName: String, comment: String){
        self.id = id
        self.userIcon = userIcon
        self.userName = userName
        self.comment = comment
        self.type = "Comment"
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

