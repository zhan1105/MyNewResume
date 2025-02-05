//
//  MySkillsUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class MySkillsUI: UIView {

    private let titleLabel = MyLabel()
    
    private let skills01 = SkillsItemUI()
    private let skills02 = SkillsItemUI()
    private let skills03 = SkillsItemUI()
    
    private let skillsStack = MyStack()
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: MySkillsUI) has not been implemented")
    }
    
    private func setupUI(){
        
        let width = UIScreen.main.bounds.width
        
        titleLabel.text = "Skills"
        titleLabel.font = .boldTitle2
        titleLabel.textAlignment = .left
        
        skills01.setImage = .swift
        skills01.setSkills = "Swift"
        
        skills02.setImage = .swiftui
        skills02.setSkills = "SwiftUI"
        
        skills03.setImage = .objectiveC
        skills03.setSkills = "Objective-C"
        
        skillsStack.addArrangedSubviews([skills01, skills02, skills03])
        skillsStack.axis = .horizontal
        skillsStack.distribution = .fillEqually
        skillsStack.translatesAutoresizingMaskIntoConstraints = false

        let subScreen = MyStack(arrangedSubviews: [titleLabel, skillsStack])
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: width * 0.05),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -width * 0.05),
            
            titleLabel.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.2),
            skillsStack.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.8),
        ])
    }
}
