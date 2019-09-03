//
//  ViewController.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    var video: VideoManager!
    
    @IBOutlet weak var milisecondLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var isShowSubtitle: Bool = false
    
    @IBAction func didTabShowHideSubtitle(_ sender: UIButton) {
        isShowSubtitle = !isShowSubtitle
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        video = VideoManager("CNN-Student-News-2019-05-24", videoView)
        video.play()
        
        tableView.register(UINib(nibName: "SubtitleHideTranslateTableViewCell", bundle: nil), forCellReuseIdentifier: "SubtitleHideTranslateTableViewCell")
        tableView.estimatedRowHeight = 10
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        video.forward(by: 3)
    }
    
    @IBAction func didTapRewindButton(_ sender: UIButton) {
        video.rewind(by: 0.3)
    }
    
    @IBAction func didTapPlayPauseButton(_ sender: UIButton) {
        if video.isPlaying {
            video.pause()
            milisecondLabel.text = "\(video.currentTime)"
        } else {
            video.play()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isShowSubtitle {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleTableViewCell") as? SubtitleTableViewCell else { return UITableViewCell() }
            cell.loadData(item: subTitle[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleHideTranslateTableViewCell") as? SubtitleHideTranslateTableViewCell else { return UITableViewCell() }
            cell.loadData(item: subTitle[indexPath.row])
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        video.play(sub: subTitle[indexPath.row])
    }
}
