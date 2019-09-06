//
//  Subtitle.swift
//  Video
//
//  Created by mac on 9/3/19.
//  Copyright © 2019 lhvan89. All rights reserved.
//

import Foundation
class Subtitle {
    var begin: Double
    var end: Double
    var engSub: String
    var vietSub: String
    init(begin: Double, end: Double, engSub: String, vietSub: String) {
        self.begin = begin
        self.end = end
        self.engSub = engSub
        self.vietSub = vietSub
    }
}

var subTitle = [
    Subtitle(begin: 11.519, end: 16.772, engSub: "Hello, everyone. I`m Carl Azuz. Thank you for taking ten minutes to get up to speed on international current events.", vietSub: "Xin chào các bạn. Tôi là Carl Azuz. Cảm ơn các bạn đã dành mười phút để cập nhật các sự kiện đang diễn ra trên thế giới."),
    Subtitle(begin: 16.772, end: 27.343, engSub: "We`re starting this Tuesday on the world`s highest mountain. Every year since 1900, at least one person has died climbing Nepal`s Mount Everest, and this year is no exception.", vietSub: "Chúng ta sẽ bắt đầu thứ Ba này trên ngọn núi cao nhất thế giới. Mỗi năm, kể từ năm 1900, có ít nhất một người thiệt mạng khi leo lên đỉnh Everest ở Nepal, và năm nay cũng không ngoại lệ."),
    Subtitle(begin: 27.343, end: 36.319, engSub: "The 2016 climbing season has claimed its first victims. One climber died on Thursday, one on Friday, one on Saturday, and one on Sunday.", vietSub: "Mùa leo núi 2016 đã công bố những nạn nhân đầu tiên của mùa này. Một người leo núi thiệt mạng hôm thứ Năm, một người thiệt mạng hôm thứ Sáu, một người hôm thứ Bảy, và một người hôm Chủ Nhật."),
    Subtitle(begin: 36.319, end: 43.381, engSub: "And these deaths coming so close together have frightened many of the climbers who are starting their trip back down the mountain.", vietSub: "Và những cái chết đến quá gần nhau đã khiến rất nhiều các nhà leo núi sợ hãi, những người đang bắt đầu chặng đường xuống núi của mình."),
    Subtitle(begin: 43.381, end: 48.706, engSub: "So, why did this happen now? Well, most people attempt to climb Everest in April and May.", vietSub: "Vậy, tại sao giờ chuyện này lại xảy ra? Vâng, hầu hết mọi người đều cố gắng trèo lên đỉnh Everest vào tháng Tư và tháng Năm."),
    Subtitle(begin: 48.706, end: 54.784, engSub: "One reason, the winds are calmer. In other months, there are usually hurricane-force winds at the summit.", vietSub: "Một lý do là, những cơn gió lặng hơn. Vào những tháng khác, thường có những trận gió bão ở đỉnh núi."),
    Subtitle(begin: 54.784, end: 62.396, engSub: "There are also tends to be less snowballing at this time of year, though temperatures are still will below zero degrees Fahrenheit.", vietSub: "Ngoài ra còn có xu hướng ít có tuyết rơi tại thời điểm này trong năm, mặc dù nhiệt độ vẫn sẽ dưới không độ Fahrenheit."),
    Subtitle(begin: 62.396, end: 69.494, engSub: "Mount Everest spring climbing season has turned deadly with four deaths now in the past four days.", vietSub: "Mùa leo đỉnh Everest vào mùa xuân này hiện đã trở nên buồn thảm với bốn người chết trong bốn ngày qua."),
    Subtitle(begin: 69.494, end: 76.669, engSub: "You have to get to 29,000 feet to get to the top of Mount Everest. And above 26,000 feet is called the death zone.", vietSub: "Bạn phải leo được 29.000 feet mới có thể đến được đỉnh Everest. Và trên 26.000 feet được gọi là khu vực tử thần."),
    Subtitle(begin: 76.601, end: 86.904, engSub: "There`s just not enough oxygen up there for your body to last very long. Now, this is the first real death from climbing that we`ve seen since they close the mountain because of the earthquake.", vietSub: "Ở trên đó không có đủ oxy để cơ thể bạn duy trì được lâu. Hiện tại, đây là cái chết thực sự đầu tiên do leo núi mà chúng ta thấy kể từ khi họ đóng cửa lên núi do động đất."),
    Subtitle(begin: 86.843, end: 94.363, engSub: "I remember, there was also the avalanche that closed part of the climbing season in 2015, 2014. So, not many people have been up there.", vietSub: "Tôi nhớ, cũng đã có trận tuyết lở khiến một phần của mùa leo núi năm 2015, năm 2014 bị đóng cửa. Vì vậy, không có nhiều người lên được đó."),
    Subtitle(begin: 94.305, end: 107.287, engSub: "They`re also saying that there are so many people trying to get to the top because it is now open again but then slowing the ascent and keeping those people, keeping theclimbers in that dead zone longer because it`s such a slow climb to the top.", vietSub: "Người ta còn nói rằng có rất nhiều người đang cố gắng để lên được đỉnh núi bởi vì bây giờ nó đã mở cửa trở lại nhưng làm chậm quá trình leo núi và giữ những người này, giữ những người leo núi trong khu vực chết đó lâu hơn vì đó là quá trình leo lên đỉnh núi chậm."),
    Subtitle(begin: 107.245, end: 119.612, engSub: "Avalanches kill people. Injuries kill people from falling, or from ISIS collapses, also weather from exposure, and, of course, just altitude sickness alone is killing people up there because of theheight of Mount Everest.", vietSub: "Tuyết lở làm chết người. Chấn thương khiến người leo núi rơi xuống, hoặc do ISIS sụp đổ, cũng do thời tiết khắc nghiệt, và, tất nhiên, chỉ riêng việc sợ độ cao cũng đang giết chết những người lên đó vì độ cao ngất trời của đỉnh Everest."),
    Subtitle(begin: 119.543, end: 125.048, engSub: "AZUZ: But for many climbers, the danger is what actually attracts them to Mount Everest.", vietSub: "AZUZ: Nhưng đối với nhiều nhà leo núi, sự nguy hiểm đó là những gì thực sự thu hút họ đến với Everest."),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
    Subtitle(begin: 0, end: 0, engSub: "", vietSub: ""),
]
