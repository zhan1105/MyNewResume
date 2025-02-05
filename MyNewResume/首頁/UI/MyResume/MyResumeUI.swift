//
//  HomeUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/3.
//

import UIKit

class MyResumeUI: UIView {
    
    private let avatarImg = MyPackageImage()
    
    private let nameLabel       = MyLabel()
    private let jobLabel        = MyLabel()
    private let graduateLabel   = MyLabel()
    private let addressLabel    = MyLabel()
    
    private let introductionStack = MyStack()

    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: HomeUI) has not been implemented")
    }
    
    private func setupUI(){
        
        let width = UIScreen.main.bounds.width
        
        avatarImg.setImage = .avatar
        avatarImg.setImageCornerRadius = 77.5
        avatarImg.setContentMode = .scaleAspectFill
        avatarImg.viewPadding()
        
        nameLabel.text = "詹紹郁"
        nameLabel.font = .boldTitle1
        
        jobLabel.text = "iOS Developer"

        graduateLabel.text = "勤益科技大學－電子工程系"
        graduateLabel.font = .callout
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemSymbol: .location)?.withTintColor(.secondaryLabel)
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let textString = NSMutableAttributedString(string: " 台中市北區")
        
        let finalString = NSMutableAttributedString()
        finalString.append(imageString)
        finalString.append(textString)
        
        addressLabel.attributedText = finalString
        addressLabel.font = .boldBody
        addressLabel.textColor = .secondaryLabel
        
        introductionStack.addArrangedSubviews([nameLabel, jobLabel, graduateLabel, addressLabel])
        introductionStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalTo: introductionStack.heightAnchor, multiplier: 0.28),
            jobLabel.heightAnchor.constraint(equalTo: introductionStack.heightAnchor, multiplier: 0.24),
            graduateLabel.heightAnchor.constraint(equalTo: introductionStack.heightAnchor, multiplier: 0.24),
            addressLabel.heightAnchor.constraint(equalTo: introductionStack.heightAnchor, multiplier: 0.24),
        ])
        
        let subScreen = MyStack(arrangedSubviews: [avatarImg, introductionStack])
        subScreen.axis = .horizontal
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor, constant: width * 0.125),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -width * 0.075),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: width * 0.05),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -width * 0.05),
            
            avatarImg.widthAnchor.constraint(equalTo: subScreen.widthAnchor, multiplier: 0.45),
            introductionStack.widthAnchor.constraint(equalTo: subScreen.widthAnchor, multiplier: 0.55),
        ])
        
    }
}
