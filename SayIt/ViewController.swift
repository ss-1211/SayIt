//
//  ViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/25.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
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
        self.postTableView.allowsSelection = false
        
        //ユーザーフィードのテストフィード生成
        let userPost1 = UserPost(id: "1", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "今日のご飯はお好み焼きやねん。",adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N )
        let userPost2 = UserPost(id: "2", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "吹田ってめっちゃ最高やなぁ", adminIcon: UIImage(named: "crazy")!, adminPostContent: "それな", adminExist: .Y)
        let userPost3 = UserPost(id: "3", userIcon: UIImage(named: "userIcon")!, userName: "TY", userPostContent: "なんばの街並みがどんどん変わってきて、少し寂しい気がするねんけど、どう思う？",adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N)
        userFeeds = [userPost1, userPost2, userPost3]
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userFeed = userFeeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        //ユーザーポスト用のタップジェスチャー設定
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappped(_:)))
//        cell.userPost.addGestureRecognizer(tapGesture)
//        cell.userPost.isUserInteractionEnabled = true

        
        if userFeed.isAdminExist() {
            cell.setUpWithComment(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent, adminPost: userFeed.adminPostContent)
            return cell
        }else{
            cell.setUp(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent, adminPost: userFeed.adminPostContent)
            return cell
        }
    }
    
    //ユーザポストタップ時の処理
    @objc func tappped(_ sender: UITapGestureRecognizer) {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
        let tappedLocation = sender.location(in: postTableView)
        let tappedIndexPath = postTableView.indexPathForRow(at: tappedLocation)
        let tappedRow = tappedIndexPath?.row
//        print(tappedRow)
//        let blurEffect = UIBlurEffect(style: .extraLight)
//        // ブラーエフェクトからエフェクトビューを作成
//        let visualEffectView = UIVisualEffectView(effect: blurEffect)
//        // エフェクトビューのサイズを画面に合わせる
//        visualEffectView.frame = self.view.frame
//        // エフェクトビューを初期viewに追加
//        self.view.addSubview(visualEffectView)
        let goodIcon = UIImage(named: "good3")
        let goodButton = UIButton(type: .system)
        goodButton.setBackgroundImage(goodIcon, for: .normal)
        goodButton.frame = CGRect(x: cell.userPost.frame.minX+100, y: cell.userPost.frame.maxY, width: 50, height: 50)
        self.view.addSubview(goodButton)
        
        let badIcon = UIImage(named: "good3")
        let badButton = UIButton(type: .system)
        badButton.setBackgroundImage(badIcon, for: .normal)
        badButton.frame = CGRect(x: cell.userPost.frame.minX+140, y: cell.userPost.frame.maxY+30, width: 50, height: 50)
        self.view.addSubview(badButton)
        
    }
}

