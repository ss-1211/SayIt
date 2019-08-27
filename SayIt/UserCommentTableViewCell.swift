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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
