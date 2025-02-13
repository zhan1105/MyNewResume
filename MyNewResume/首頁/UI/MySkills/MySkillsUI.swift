//
//  MySkillsUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class MySkillsUI: UIView {

    private let titleLabel = MyLabel()
    
    private let skills_Swift = SkillsItemUI()
    private let skills_SwiftUI = SkillsItemUI()
    private let skills_ObjectiveC = SkillsItemUI()
    
    private let skillsStack = MyStack()
    
    func onTapAction_Skills(type: SkillsType, onTapAction: (() -> Void)?) {
        switch type {
        case .Swift:
            skills_Swift.onTapAction = onTapAction
        case .SwiftUI:
            skills_SwiftUI.onTapAction = onTapAction
        case .ObjectiveC:
            skills_ObjectiveC.onTapAction = onTapAction
        }
    }
    
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
        
        skills_Swift.setImage = .swift
        skills_Swift.setSkills = "Swift"
        
        skills_SwiftUI.setImage = .swiftui
        skills_SwiftUI.setSkills = "SwiftUI"
        
        skills_ObjectiveC.setImage = .objectiveC
        skills_ObjectiveC.setSkills = "Objective-C"
        
        skillsStack.addArrangedSubviews([skills_Swift, skills_SwiftUI, skills_ObjectiveC])
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
