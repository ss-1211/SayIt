//
//  UserCommentTableViewCell.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/27.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class UserCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        comment.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1)
        comment.layer.cornerRadius = 7
        userIcon.layer.cornerRadius = 15
//        self.addSubview(CommentBalloonView(frame: CGRect(x: comment.frame.maxX, y: comment.frame.minY+60, width: 30, height: 30)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
