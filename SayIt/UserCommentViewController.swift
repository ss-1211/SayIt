//
//  UserCommentViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/27.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class UserCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func barButton(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SuperHome") as! UITestViewController
        self.present(vc, animated: true, completion: nil)
    }
    
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
        userCommentTable.separatorColor = UIColor.clear
        
        let comment1 = CommentPost(id: "1", userIcon:UIImage(named: "userIcon")!, userName: "Test", comment: "面白いね。")
        let comment2 = CommentPost(id: "1", userIcon:UIImage(named: "userIcon")!, userName: "Takuya", comment: "素敵やああああああああああん")
        commentFeeds = [comment1,comment2]
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentFeeds.count + userFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "Comment") as! UserCommentTableViewCell
        if indexPath.row == 0 {
            let userFeed = userFeeds[indexPath.row]
            cell.setUp(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent,userPostImage: userFeed.userPostImage, adminPost: userFeed.adminPostContent)
            return cell
        }else{
            let commentFeed = commentFeeds[indexPath.row - 1]
            commentCell.userName.text = commentFeed.userName
            commentCell.userIcon.image = commentFeed.userIcon
            commentCell.comment.text = commentFeed.comment
            return commentCell
            }
        }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row == 0 {
            let favoriteAction = UIContextualAction(style: .normal,
                                                    title: "なんでやねん",
                                                    handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                        print("なんでやねん")
                                                        // 処理を実行完了した場合はtrue
                                                        completion(true)
            })
            favoriteAction.backgroundColor = UIColor.black
            favoriteAction.image = UIImage(named: "good3")
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        } else {
            let favoriteAction = UIContextualAction(style: .normal,
                                                    title: "ナイスツッコミ！",
                                                    handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                        print("ナイス")
                                                        // 処理を実行完了した場合はtrue
                                                        completion(true)
            })
            favoriteAction.backgroundColor = UIColor.black
            favoriteAction.image = UIImage(named: "good3")
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        }
        
    }
    
}
