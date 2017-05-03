//
//  customTableViewCell.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/1.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
