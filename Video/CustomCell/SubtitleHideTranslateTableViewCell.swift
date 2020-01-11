//
//  SubtitleHideTranslateTableViewCell.swift
//  Video
//
//  Created by mac on 9/4/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class SubtitleHideTranslateTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(item: Sub) {
        titleLabel.text = item.engSub
    }
    
}
