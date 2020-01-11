//
//  SubtitleSetTimingTableViewCell.swift
//  Video
//
//  Created by mac on 9/5/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class SubtitleSetTimingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beginLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    @IBOutlet weak var setStartTimeButton: UIButton!
    @IBOutlet weak var setEndTimeButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    
    var setStartTimeAction: (() -> ())?
    var setEndTimeAction: (() -> ())?
    var reloadAction: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setStartTimeButton.addTarget(self, action: #selector(didTapSetStartTimeButotn(_:)), for: .touchUpInside)
        self.setEndTimeButton.addTarget(self, action: #selector(didTapSetEndTimeButton(_:)), for: .touchUpInside)
        self.reloadButton.addTarget(self, action: #selector(didTapReplayButton(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadData(item: Sub) {
        titleLabel.text = item.engSub
        beginLabel.text = String(format: "%.3f", item.startTime)
        endLabel.text = String(format: "%.3f", item.endTime)
    }
    
    @IBAction func didTapSetStartTimeButotn(_ sender: UIButton) {
        setStartTimeAction?()
    }
    
    @IBAction func didTapSetEndTimeButton(_ sender: UIButton) {
        setEndTimeAction?()
    }
    
    @IBAction func didTapReplayButton(_ sender: UIButton) {
        reloadAction?()
    }
}
