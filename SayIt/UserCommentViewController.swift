//
//  UserCommentViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/27.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class UserCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var userCommentTable: UITableView!
    
    var tableData:[TableData] = []
    var commentFeeds: [CommentPost] = []
    var userFeeds:[UserPost] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCommentTable.estimatedRowHeight = 1000
        userCommentTable.rowHeight = UITableView.automaticDimension
        userCommentTable.delegate = self
        userCommentTable.dataSource = self
        userCommentTable.register(UINib(nibName: "UserCommentTableViewCell", bundle: nil), forCellReuseIdentifier: "Comment")
        userCommentTable.register(UINib(nibName: "UserPostCell", bundle: nil), forCellReuseIdentifier: "UserPost")
        self.userCommentTable.allowsSelection = false
        
        let comment1 = CommentPost(id: "1", userIcon:UIImage(named: "userIcon")!, userName: "Test", comment: "面白いね。")
        let comment2 = CommentPost(id: "1", userIcon:UIImage(named: "userIcon")!, userName: "Test", comment: "面白いね。")
        commentFeeds = [comment1,comment2]
        tableData = [userFeeds, commentFeeds] as! [TableData]
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "Comment") as! UserCommentTableViewCell
        
        if data.commentPost == nil {
            if data.userPost!.isAdminExist() {
                cell.setUpWithComment(userIcon: data.userPost!.userIcon, userName: data.userPost!.userName, userPost: data.userPost!.userPostContent, adminPost: data.userPost?.adminPostContent)
                return cell
            }else{
                cell.setUp(userIcon: data.userPost!.userIcon, userName: data.userPost!.userName, userPost: data.userPost!.userPostContent, adminPost: data.userPost?.adminPostContent)
                return cell
            }
        }else{
            commentCell.userName.text = data.commentPost!.userName
            commentCell.userIcon.image = data.commentPost!.userIcon
            commentCell.comment.text = data.commentPost!.comment
            return commentCell
            }
        }
}
