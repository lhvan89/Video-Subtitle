//
//  VideoManager.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

class VideoManager {
    
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    var isLockTap = false
    var timer: Timer?
    
    init(_ name: String, _ frame: UIView) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp4") else { return }
        let screenWidth = UIScreen.main.bounds.size.width
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame.size.width = screenWidth//50//frame.bounds.width
        playerLayer.frame.size.height = screenWidth * (360/640) //frame.bounds.height
        frame.layer.addSublayer(playerLayer)
    }
    
    
    func play() {
        player.currentItem?.forwardPlaybackEndTime = CMTime(seconds: duration, preferredTimescale: 1000)
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    var isPlaying: Bool {
        return player.isPlaying
    }
    
    var currentTime: Float64 {
        return CMTimeGetSeconds(player.currentTime())
    }
    
    var duration: Float64 {
        if let duration = player.currentItem?.duration {
            return  CMTimeGetSeconds(duration)
        }
        return 0
    }
    
    func seek(to second: Double) {
        player.seek(to: CMTime(seconds: second, preferredTimescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func play(sub: Sub) {
        player.seek(to: CMTime(seconds: sub.startTime, preferredTimescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)

        player.currentItem?.forwardPlaybackEndTime = CMTime(seconds: sub.endTime, preferredTimescale: 1000)
        player.play()
    }
    
    func forward(by seconds: Float64) {
        var newTime = currentTime + seconds
        newTime = (newTime >= duration) ? duration : newTime
        seek(to: newTime)
    }
    
    func rewind(by seconds: Float64) {
        var newTime = currentTime - seconds
        newTime = (newTime <= 0) ? 0 : newTime
        seek(to: newTime)
    }
}
