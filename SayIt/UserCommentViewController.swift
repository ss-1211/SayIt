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
    
    var commentFeeds: [CommentPost] = []
    var userFeeds = [UserPost]()
    
    
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
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentFeeds.count + userFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userFeed = userFeeds[indexPath.row]
        let commentFeed = commentFeeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "Comment") as! UserCommentTableViewCell
        if userFeed.type == "Post" {
            if userFeed.isAdminExist() {
                cell.setUpWithComment(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent, adminPost: userFeed.adminPostContent)
                return cell
            }else{
                cell.setUp(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent, adminPost: userFeed.adminPostContent)
                return cell
            }
        }else{
            commentCell.userName.text = commentFeed.userName
            commentCell.userIcon.image = commentFeed.userIcon
            commentCell.comment.text = commentFeed.comment
            return commentCell
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
