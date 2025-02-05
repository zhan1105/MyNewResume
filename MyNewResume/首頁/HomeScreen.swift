//
//  HomeScreen.swift
//  MyNewResume
//
//  Created by 紹郁 on 2025/2/3.
//

import UIKit

class HomeScreen: MyViewController {
    
    private let scrollView = UIScrollView()
    private var contentView: HomeUI!
    
    private let experienceItem = ExperienceItem().experienceData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGrayWhite
        setupUI()
    }
}

//MARK: - UI
extension HomeScreen {
    private func setupUI() {
                
        let width = UIScreen.main.bounds.width
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        contentView = HomeUI(width: width, height: safeAreaHeight)
                
        contentView.setTableDelegate(self)
        
        contentView.contactButtonAction = { [weak self] in
            guard let self = self else { return }
            self.overlayAlert(ContactAlert())
        }
        
        let appScreen = MyStack(arrangedSubviews: [scrollView])
        appScreen.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(appScreen)
        NSLayoutConstraint.activate([
            appScreen.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            appScreen.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            appScreen.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            appScreen.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

//MARK: - TableViewDelegate
extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experienceItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCell", for: indexPath) as? ExperienceCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        let data = experienceItem[index]
        
        cell.setTime = data.time
        cell.setPosition = data.position
        cell.setCompany = data.company

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
}
