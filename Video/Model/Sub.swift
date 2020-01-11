//
//  Sub.swift
//  Video
//
//  Created by mac on 1/11/20.
//  Copyright © 2020 lhvan89. All rights reserved.
//

import Foundation

class Sub {
    var startTime: Double = 0
    var endTime: Double = 0
    var engSub: String = ""
    var vietSub: String = ""
    
    init(_ startTime: Double, _ endTime: Double, _ engSub: String, _ vietSub: String) {
        self.startTime = startTime
        self.endTime = endTime
        self.engSub = engSub
        self.vietSub = vietSub
    }
}

class Lesstion {
    var title: String = ""
    var file: String = ""
    var items: [Sub] = []
    
    init() {
    }
    
    init(_ title: String, _ file: String, _ items: [Sub]) {
        self.title = title
        self.file = file
        self.items = items
    }
}
