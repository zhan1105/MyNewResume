//
//  ExperienceUI.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/4.
//

import UIKit

class ExperienceUI: UIView {
    
    private let titleLabel = MyLabel()
    private let experienceTable = UITableView()

    func setTableDelegate(_ delegate: UITableViewDelegate & UITableViewDataSource) {
        experienceTable.delegate = delegate
        experienceTable.dataSource = delegate
        experienceTable.register(ExperienceCell.self, forCellReuseIdentifier: "ExperienceCell")
    }
    
    func reloadExperienceTable(){
        experienceTable.reloadData()
    }
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ExperienceUI) has not been implemented")
    }
    
    private func setupUI(){
        
        let width = UIScreen.main.bounds.width

        titleLabel.text = "Experience"
        titleLabel.font = .boldTitle2
        titleLabel.textAlignment = .left
        
        experienceTable.separatorStyle = .none
        experienceTable.backgroundColor = .clear
        experienceTable.isScrollEnabled = false
        
        let subScreen = MyStack(arrangedSubviews: [titleLabel, experienceTable])
        subScreen.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subScreen)
        NSLayoutConstraint.activate([
            subScreen.topAnchor.constraint(equalTo: topAnchor),
            subScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
            subScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: width * 0.05),
            subScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -width * 0.05),
            
            titleLabel.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.2),
            experienceTable.heightAnchor.constraint(equalTo: subScreen.heightAnchor, multiplier: 0.8),
        ])
    }
}
