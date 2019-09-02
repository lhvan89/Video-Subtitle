//
//  ViewController.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    @IBOutlet weak var milisecondLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideo()
        playVideo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        forwardVideo(by: 1)
    }
    
    @IBAction func didTapRewindButton(_ sender: UIButton) {
        rewindVideo(by: 1)
    }
    
    @IBAction func didTapPlayPauseButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            milisecondLabel.text = "\(CMTimeGetSeconds(player.currentTime()))"
        } else {
            player.play()
        }
    }
    
    
    func setupVideo(){
        guard let path = Bundle.main.path(forResource: "CNN-Student-News-2019-05-24", ofType: "mp4") else { return }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoView.bounds
        videoView.layer.addSublayer(playerLayer)
    }
    
    func playVideo() {
        player.play()
    }
    
    func forwardVideo(by seconds: Float64) {

        guard let duration = player.currentItem?.duration else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())

        let durationTime = CMTimeGetSeconds(duration)
        
        var newTime = currentTime + seconds
        
        if newTime >= durationTime {
            newTime = durationTime
        }
        
        player.seek(to: CMTime(value: CMTimeValue(newTime*1000), timescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func rewindVideo(by seconds: Float64) {
        
        guard let duration = player.currentItem?.duration else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        
        let durationTime = CMTimeGetSeconds(duration)
        
        var newTime = currentTime - seconds
        
        if newTime >= durationTime {
            newTime = durationTime
        }
        
        player.seek(to: CMTime(value: CMTimeValue(newTime*1000), timescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func seek(to second: Double) {
        player.seek(to: CMTime(seconds: second, preferredTimescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func playSubtitle(sub: Subtitle) {
        player.seek(to: CMTime(seconds: sub.startTime, preferredTimescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
        player.play()
        let duration = sub.stopTime - sub.startTime
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.player.pause()
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = subTitle[indexPath.row].sub
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSubtitle(sub: subTitle[indexPath.row])
    }
}
