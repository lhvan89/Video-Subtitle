//
//  AVPlayer+isPlaying.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
import AVFoundation

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
