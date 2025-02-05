//
//  ExperienceCell.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class ExperienceCell: UITableViewCell {
    
    private let circle = MyView()
    private let circleView = MyView()
    
    private let timeLabel = MyLabel()
    private let positionLabel = MyLabel()
    private let companyLabel = MyLabel()
    
    private let experienceStack = MyStack()

    var setTime: String? {
        didSet {
            timeLabel.text = setTime
        }
    }
    
    var setPosition: String? {
        didSet {
            positionLabel.text = setPosition
        }
    }
    
    var setCompany: String? {
        didSet {
            companyLabel.text = setCompany
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ExperienceCell) has not been implemented")
    }
    
    private func setupUI() {
                
        let width = UIScreen.main.bounds.width
        
        circle.backgroundColor = .charcoalBlack
        circle.layer.cornerRadius = 5
        
        circleView.addSubview(circle)
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            circle.widthAnchor.constraint(equalToConstant: 10),
            circle.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        timeLabel.textColor = .secondaryLabel
        timeLabel.textAlignment = .left
        timeLabel.padding(to: 0, top: width * 0.025)
        
        positionLabel.font = .boldHeadline
        positionLabel.textAlignment = .left
        
        companyLabel.textAlignment = .left
        companyLabel.padding(to: 0, bottom: width * 0.025)

        experienceStack.addArrangedSubviews([timeLabel, positionLabel, companyLabel])
        experienceStack.distribution = .fillEqually
        experienceStack.translatesAutoresizingMaskIntoConstraints = false
        
        let subScreen = MyStack(arrangedSubviews: [circleView, experienceStack])
        subScreen.axis = .horizontal
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor, constant: width * 0.01),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -width * 0.01),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            circleView.widthAnchor.constraint(equalTo: subScreen.widthAnchor, multiplier: 0.15),
            experienceStack.widthAnchor.constraint(equalTo: subScreen.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // 設定高度
    static func cellHeight(for tableView: UITableView) -> CGFloat {
        return tableView.frame.height / 2
    }
}
