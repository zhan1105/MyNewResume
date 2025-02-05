//
//  ContactAlert.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class ContactAlert: MyViewController {
    
    private let phoneButton = MyPackageButton()
    private let lineButton = MyPackageButton()
    private let facebaookButton = MyPackageButton()
    private let figmaButton = MyPackageButton()
    
    private let contactStack = MyStack()
    
    private let cancelButton = MyPackageButton()

    private func contactButtonAction(type: ContactType) {
        
        var link: String = ""
        
        switch type {
        case .Phone:
            link = "tel://0985732745"
        case .Line:
            link = "https://line.me/ti/p/j5lKytr_xG"
        case .Github:
            link = "https://www.facebook.com/share/1A6yLCaoUS/?mibextid=wwXIfr"
        case .Figma:
            link = "https://www.figma.com/board/WTID8WVJTGrjdTWJlDFhf7/Untitled?node-id=903-954&t=RXpets6dhg4LfVQR-0"
        }
        
        let url = URL(string: link)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setMyBackgroundColor(.charcoalBlack.withAlphaComponent(0.6))
        setupUI()
    }
}

//MARK: - UI
extension ContactAlert {
    private func setupUI() {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        phoneButton.buttonImage = .phoneIcon
        phoneButton.viewPadding(to: width * 0.01, left: width * 0.025, right: width * 0.005)
        phoneButton.buttonAction = { [weak self] in self?.contactButtonAction(type: .Phone) }
        
        lineButton.buttonImage = .lineIcon
        lineButton.viewPadding(to: width * 0.01, left: width * 0.005, right: width * 0.005)
        lineButton.buttonAction = { [weak self] in self?.contactButtonAction(type: .Line) }

        facebaookButton.buttonImage = .githubIcon
        facebaookButton.viewPadding(to: width * 0.01, left: width * 0.005, right: width * 0.005)
        facebaookButton.buttonAction = { [weak self] in self?.contactButtonAction(type: .Github) }

        figmaButton.buttonImage = .figma
        figmaButton.viewPadding(to: width * 0.04, left: width * 0.005, right: width * 0.025)
        figmaButton.buttonAction = { [weak self] in self?.contactButtonAction(type: .Figma) }

        contactStack.addArrangedSubviews([phoneButton, lineButton, facebaookButton, figmaButton])
        contactStack.axis = .horizontal
        contactStack.distribution = .fillEqually
        contactStack.translatesAutoresizingMaskIntoConstraints = false
        
        cancelButton.buttonText = "取消"
        cancelButton.textColor = .secondaryLabel
        cancelButton.buttonBackground = .clear
        cancelButton.viewPadding(bottom: width * 0.025)
        cancelButton.buttonAction = { [weak self] in self?.dismissOverlay() }
        
        let appScreen = MyStack(arrangedSubviews: [contactStack, cancelButton])
        appScreen.alignment = .center
        appScreen.backgroundColor = .pureWhite
        appScreen.layer.cornerRadius = 15
        appScreen.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(appScreen)
        NSLayoutConstraint.activate([
            appScreen.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            appScreen.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            appScreen.heightAnchor.constraint(equalToConstant: height * 0.2),
            appScreen.widthAnchor.constraint(equalToConstant: width * 0.95),
            
            contactStack.heightAnchor.constraint(equalTo: appScreen.heightAnchor, multiplier: 0.7),
            cancelButton.heightAnchor.constraint(equalTo: appScreen.heightAnchor, multiplier: 0.3),
        ])
    }
}
