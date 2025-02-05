//
//  MySkillsCell.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class SkillsItemUI: UIView {

    private let skillsImage = MyPackageImage()
    private let skillsLabel = MyLabel()
    
    var setImage: UIImage? {
        didSet {
            skillsImage.setImage = setImage
        }
    }
    
    var setSkills: String? {
        didSet {
            skillsLabel.text = setSkills
        }
    }
    
    var onTapAction: (() -> Void)?
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: SkillsUI) has not been implemented")
    }
    
    private func setupUI(){
        
        let width = UIScreen.main.bounds.width
        
        skillsImage.viewPadding(to: width * 0.025)
        
        skillsLabel.font = .callout
        skillsLabel.textAlignment = .center
        
        let subScreen = MyStack(arrangedSubviews: [skillsImage, skillsLabel])
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor, constant: width * 0.025),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -width * 0.025),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: width * 0.0375),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -width * 0.0375),
            
            skillsImage.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.8),
            skillsLabel.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.2),
        ])
    }
    
    private func setupTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(){
        onTapAction?()
    }
}


