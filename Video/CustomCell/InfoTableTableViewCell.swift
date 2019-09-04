//
//  InfoTableTableViewCell.swift
//  Video
//
//  Created by Van Le on 9/4/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class InfoTableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(title: String) {
        titleLabel.text = title
    }
    
}
