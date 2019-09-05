//
//  ViewController.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

enum TypeOfDisplaySubtitle {
    case engSub
    case translate
    case setTiming
}
class ViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    var video: VideoManager!
    
    @IBOutlet weak var milisecondLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var showHideControllButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toolBarView: UIView!
    
    
    var typeOfDisplay: TypeOfDisplaySubtitle = .engSub
    
    @IBAction func didTabShowTranslateSubtitle(_ sender: UIButton) {
        typeOfDisplay = .translate
        tableView.allowsSelection = true
        tableView.reloadData()
    }
    
    @IBAction func didTabShowEngSub(_ sender: UIButton) {
        typeOfDisplay = .engSub
        tableView.allowsSelection = true
        tableView.reloadData()
    }
    
    @IBAction func didTabSetTimingSubtitleButton(_ sender: UIButton) {
        typeOfDisplay = .setTiming
        tableView.allowsSelection = false
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        video = VideoManager("CNN-Student-News-2019-05-24", videoView)
        video.play()
        
        tableView.register(UINib(nibName: "SubtitleHideTranslateTableViewCell", bundle: nil), forCellReuseIdentifier: "SubtitleHideTranslateTableViewCell")
        tableView.register(UINib(nibName: "InfoTableTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableTableViewCell")
        tableView.register(UINib(nibName: "SubtitleSetTimingTableViewCell", bundle: nil), forCellReuseIdentifier: "SubtitleSetTimingTableViewCell")
        tableView.estimatedRowHeight = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        video.forward(by: 3)
    }
    
    @IBAction func didTapRewindButton(_ sender: UIButton) {
        video.rewind(by: 0.3)
    }
    @IBAction func didTabShowHideControlButton(_ sender: UIButton) {
        showHideControllButton.isSelected = !showHideControllButton.isSelected
        titleLabel.isHidden = !showHideControllButton.isSelected
        playPauseButton.isHidden = !showHideControllButton.isSelected
        toolBarView.isHidden = !showHideControllButton.isSelected
    }
    
    @IBAction func didTapPlayPauseButton(_ sender: UIButton) {
        if video.isPlaying {
            video.pause()
            milisecondLabel.text = "\(video.currentTime)"
        } else {
            video.play()
        }
        self.playPauseButton.setImage(UIImage(named: self.video.isPlaying ? "icon_pause" : "icon_play"), for: .normal)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return subTitle.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableTableViewCell") as? InfoTableTableViewCell else { return UITableViewCell() }
            cell.loadData(title: "CNN Student News - May 24, 2016")
            cell.separatorInset = .zero
            return cell
        default:
            switch typeOfDisplay {
            case .translate:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleTableViewCell") as? SubtitleTableViewCell else { return UITableViewCell() }
                cell.loadData(item: subTitle[indexPath.row])
                return cell
            case .engSub:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleHideTranslateTableViewCell") as? SubtitleHideTranslateTableViewCell else { return UITableViewCell() }
                cell.loadData(item: subTitle[indexPath.row])
                return cell
            case .setTiming:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleSetTimingTableViewCell") as? SubtitleSetTimingTableViewCell else { return UITableViewCell() }
                cell.setStartTimeAction = { [unowned self] in
                    subTitle[indexPath.row].begin = self.video.currentTime
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                
                
                cell.setEndTimeAction = { [unowned self] in
                    subTitle[indexPath.row].end = self.video.currentTime
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                
                cell.reloadAction = { [unowned self] in
                    self.video.play(sub: subTitle[indexPath.row])
                }
                cell.loadData(item: subTitle[indexPath.row])

                return cell
            }
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        video.play(sub: subTitle[indexPath.row])
    }
}
