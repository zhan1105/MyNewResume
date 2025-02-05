//
//  picture.swift
//  UIKitTest
//
//  Created by 紹郁 on 2024/8/16.
//

import Foundation

typealias Image = (name: String, url: URL)

struct ImageNameItem {
    
    let imageData: [Image] = [("test", URL(string: "https://maps.app.goo.gl/51fKdFH4Qdu8xp1f7")!),
                               ("test2", URL(string: "https://www.youtube.com/")!),
                               ("test3", URL(string: "https://may-god.com/")!)]
}
