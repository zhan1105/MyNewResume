//
//  HomeUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class HomeUI: UIView {

    private let myResume = MyResumeUI()
    private let contactInfo = ContactInfoUI()
    private let mySkills = MySkillsUI()
    private let experience = ExperienceUI()

    var contactButtonAction: (() -> Void)? {
        didSet {
            contactInfo.buttonAction = contactButtonAction
        }
    }
    
    func setTableDelegate(_ delegate: UITableViewDelegate & UITableViewDataSource) {
        experience.setTableDelegate(delegate)
    }
    
    func reloadExperienceTable(){
        experience.reloadExperienceTable()
    }
    
    func onTapAction_Skills(_ type: SkillsType, onTapAction: (() -> Void)?) {
        mySkills.onTapAction_Skills(type: type, onTapAction: onTapAction)
    }
    
    init(width: CGFloat, height: CGFloat){
        super.init(frame: .zero)
        setupUI(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: HomeUI) has not been implemented")
    }
    
    private func setupUI(width: CGFloat, height: CGFloat){
                
        let subScreen = MyStack(arrangedSubviews: [myResume, contactInfo, mySkills, experience])
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            myResume.heightAnchor.constraint(equalToConstant: height * 0.275),
            contactInfo.heightAnchor.constraint(equalToConstant: height * 0.225),
            mySkills.heightAnchor.constraint(equalToConstant: height * 0.175),
            experience.heightAnchor.constraint(equalToConstant: height * 0.325),
        ])
    }

}
