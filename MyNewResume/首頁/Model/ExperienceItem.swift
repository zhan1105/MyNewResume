//
//  ExperienceItem.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import Foundation

typealias Experience = (time: String, position: String, company: String)

struct ExperienceItem {
    
    let experienceData: [Experience] = [("2022 年 11 月 - 2024 年 7 月", "App Deleloper", "立大資訊網路股份有限公司"),
                                        ("2024 年 8 月 - 至今", "iOS 研發人員", "美家人力資源股份有限公司")]
}
