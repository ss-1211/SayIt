//
//  ProfileSettingViewController.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/28.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ProfileSettingViewController: UIViewController {
    
    var userFeeds: [UserPost] = []
    var user: [User] = []
    
    //ヘッダーのBlur View
    @IBOutlet weak var effectiveView: UIVisualEffectView!
    //プロフィール変更ボタン
    @IBAction func changeProfile(_ sender: UIButton) {
    }
    //ユーザーアイコン
    @IBOutlet weak var userIcon: UIImageView!
    //ユーザー名
    @IBOutlet weak var userName: UILabel!
    //自己紹介
    @IBOutlet weak var userIntroduction: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    //ヘッダーのイメージ
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    //セグメントのアクション
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            baseTableView.reloadData()
            tableCategory = .userPost
        case 1:
            return
        default:
            return
        }
    }
    @IBOutlet weak var baseTableView: UITableView!
    let first = Array(repeating: "First", count: 20)
    //テーブルカテゴリーの分岐初期値
    var tableCategory = Pattern.userPost
    //テーブルカテゴリーの列挙型
    enum Pattern: String {
        case userPost
        case tsukkomi
        case boke
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseTableView.delegate = self
        baseTableView.dataSource = self
        scrollView.delegate = self
        effectiveView.isHidden = true
        baseTableView.register(UINib(nibName: "UserPostCell", bundle: nil), forCellReuseIdentifier: "UserPost")
        //ユーザーサンプルデータ
        user = [User(userId: "1", userName: "Shun", userIcon: UIImage(named: "userIcon")!, introduction: "しがないえiOSエンジニア。将来はフィンランドに住んで、悠々自適な生活を送りたい。", boke: 2, tsukkomi: 3)]
        
        
        //ユーザー画面の設定
        userName.text = user[0].userName
        userIcon.image = user[0].userIcon
        userIntroduction.text = user[0].introduction
        
        //サンプルデータ
        let userPost1 = UserPost(id: "1", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "今日のご飯はお好み焼きやねん。", userPostImage:nil,adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N)
        let userPost2 = UserPost(id: "2", userIcon: UIImage(named: "userIcon")!, userName: "Shun", userPostContent: "吹田ってめっちゃ最高やなぁ", userPostImage:UIImage(named: "DWYL_neon2.jpeg"), adminIcon: UIImage(named: "crazy")!, adminPostContent: "それな", adminExist: .Y)
        let userPost3 = UserPost(id: "3", userIcon: UIImage(named: "userIcon")!, userName: "TY", userPostContent: "なんばの街並みがどんどん変わってきて、少し寂しい気がするねんけど、どう思う？", userPostImage: nil,adminIcon: UIImage(named: "crazy")!, adminPostContent: "", adminExist: .N)
        userFeeds = [userPost1, userPost2, userPost3]
        
        
        
    }
}
extension ProfileSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableCategory {
        case .userPost:
            return userFeeds.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch tableCategory {
        case .userPost:
            let userFeed = userFeeds[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserPost") as! UserPostCell
            
            cell.setUp(userIcon: userFeed.userIcon, userName: userFeed.userName, userPost: userFeed.userPostContent,userPostImage: userFeed.userPostImage, adminPost: userFeed.adminPostContent)
            return cell
        default:
            cell.textLabel?.text = first[indexPath.item]
        }
        return cell
    }
}
extension ProfileSettingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        effectiveView.isHidden = false
        effectiveView.alpha = offset > 0 ? min(0.8, max(0, (offset-100)/50)) : min(0.8, max(0, -offset/80))
    }

}
