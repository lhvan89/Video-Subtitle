//
//  Subtitle.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
class Subtitle {
    var startTime: Double
    var stopTime: Double
    var sub: String
    init(startTime: Double, stopTime: Double, sub: String) {
        self.startTime = startTime
        self.stopTime = stopTime
        self.sub = sub
    }
}

var subTitle = [
    Subtitle(startTime: 10.7, stopTime: 17.020, sub: "Hello, everyone. I`m Carl Azuz. Thank you for taking ten minutes to get up to speed on international current events."),
    Subtitle(startTime: 13.2, stopTime: 16.8, sub: "Thank you for taking ten minutes to get up to speed on international current events."),
    Subtitle(startTime: 16.8, stopTime: 20.0, sub: "We`re starting this Tuesday on the world`s highest mountain.")
]
