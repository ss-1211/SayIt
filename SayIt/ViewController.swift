//
//  ViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBAction func baButton(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SuperHome") as! UITestViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    var userFeeds: [UserPost] = []

    @IBOutlet weak var postTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.estimatedRowHeight = 1000
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.delegate = self
        postTableView.dataSource = self
        //ユーザーの投稿内容セル
        postTableView.register(UINib(nibName: "UserPostCell", bundle: nil), forCellReuseIdentifier: "UserPost")
//        self.postTableView.allowsSelection = false
        
        //ユーザーフィードのテストフィード生成
        let userPost1 = UserPost(id: "1", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "今日のご飯はお好み焼きやねん。", userPostImage:nil,adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N)
        let userPost2 = UserPost(id: "2", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "吹田ってめっちゃ最高やなぁ", userPostImage:UIImage(named: "osakakoku_logo"), adminIcon: UIImage(named: "crazy")!, adminPostContent: "それな", adminExist: .Y)
        let userPost3 = UserPost(id: "3", userIcon: UIImage(named: "userIcon")!, userName: "TY", userPostContent: "なんばの街並みがどんどん変わってきて、少し寂しい気がするねんけど、どう思う？", userPostImage: nil,adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N)
        userFeeds = [userPost1, userPost2, userPost3]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userFeed = userFeeds[indexPath.row]
        let commentView = storyboard?.instantiateViewController(withIdentifier: "CommentView") as! UserCommentViewController
        commentView.userFeeds = [userFeed]
        self.present(commentView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userFeed = userFeeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        cell.setUp(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent,userPostImage: userFeed.userPostImage, adminPost: userFeed.adminPostContent)
            return cell
    }
    //セルをスワイプした時のアクションを設定
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal,
                                                title: "なんでやねん",
                                                handler: { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
                                                    print("Favorite")
                                                    // 処理を実行完了した場合はtrue
                                                    completion(true)
        })
        favoriteAction.backgroundColor = UIColor.black
        favoriteAction.image = UIImage(named: "good3")
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
    
}

