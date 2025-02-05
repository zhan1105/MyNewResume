//
//  ContactInfoUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class ContactInfoUI: UIView {

    private let infoLabel = MyLabel()
    private let contactButton = MyPackageButton()
    
    var buttonAction: (() -> Void)? {
        didSet {
            contactButton.buttonAction = buttonAction
        }
    }
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ContactInfoUI) has not been implemented")
    }
    
    private func setupUI(){
        
        let width = UIScreen.main.bounds.width

        infoLabel.text = "現在正在一邊自學 SwiftUI，一邊加深 Swift中，希望讓自己更上一層樓，並投入到更頂尖的工作中 😊"
        infoLabel.font = .headline
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 0
        infoLabel.padding(to: 0, left: width * 0.05, right: width * 0.05)

        contactButton.buttonText = "Contact Me"
        contactButton.textFont = .boldTitle2
        contactButton.buttonBackground = .lightBrown
        contactButton.buttonCornerRadius = 20
        contactButton.viewPadding(to: width * 0.05)
        
        let subScreen = MyStack(arrangedSubviews: [infoLabel, contactButton])
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoLabel.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.55),
            contactButton.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.45),
        ])
    }
}
