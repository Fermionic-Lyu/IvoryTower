//
//  SecondViewController.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/27.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class MyAcademicProfileCell : UITableViewCell {
    let avatar : UIImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    let subLabel : UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        avatar.frame = CGRect(x: 20.0, y: 15.0, width: 50.0, height: 50.0)
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 25.0
        contentView.addSubview(avatar)
        
        nameLabel.frame = CGRect(x: 85.0, y: 15.0, width: 100.0, height: 30.0)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        contentView.addSubview(nameLabel)
        
        subLabel.frame = CGRect(x: 85.0, y: 45.0, width: 200.0, height: 20.0)
        subLabel.font = UIFont.systemFont(ofSize: 16.0)
        subLabel.textColor = UIColor.lightGray
        contentView.addSubview(subLabel)
        
        accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let separator = UIView(frame: CGRect(x: 15.0, y: 79.0, width: UIScreen.main.bounds.size.width - 30.0, height: 1.0))
        separator.backgroundColor = UIColor(red:0xEF/0xFF, green: 0xEF/0xFF, blue: 0xF4/0xFF, alpha: 1.0)
        contentView.addSubview(separator)
    }
}

class MyAcademicStatsCell : UITableViewCell {
    private let statTexts = ["上学期GPA", "专业排名", "已上课程数", "学分"]
    var statLabels : Array<UILabel> = []
    var statValues : Array<UILabel> = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        for (index,text) in statTexts.enumerated() {
            statLabels.append(UILabel(frame: CGRect(x: 25.0 + (UIScreen.main.bounds.size.width - 50.0)/4.0 * CGFloat(index), y: 15.0, width: (UIScreen.main.bounds.size.width - 50.0)/4.0, height: 20.0)))
            statLabels[index].font = UIFont.systemFont(ofSize: 14.0)
            statLabels[index].text = text
            statLabels[index].textAlignment = NSTextAlignment.center
            contentView.addSubview(statLabels[index])
            
            statValues.append(UILabel(frame: CGRect(x: 25.0 + (UIScreen.main.bounds.size.width - 50.0)/4.0 * CGFloat(index), y: 40.0, width: (UIScreen.main.bounds.size.width - 50.0)/4.0, height: 30.0)))
            statValues[index].font = UIFont.boldSystemFont(ofSize: 18.0)
            statValues[index].textAlignment = NSTextAlignment.center
            contentView.addSubview(statValues[index])
        }
    }
}

class MyAcademicUtilitiesCell : UITableViewCell {
    let utilityIcon : UIImageView = UIImageView()
    let utilityNameLabel : UILabel  = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        utilityIcon.frame = CGRect(x: 20.0, y: 15.0, width: 30.0, height: 30.0)
        utilityNameLabel.frame = CGRect(x: 65.0, y: 0.0, width: 200.0, height: 56.0)
        utilityNameLabel.font = UIFont.systemFont(ofSize: 16.0)
        contentView.addSubview(utilityIcon)
        contentView.addSubview(utilityNameLabel)
        accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let separator = UIView(frame: CGRect(x: 0.0, y: 55.0, width: UIScreen.main.bounds.size.width, height: 1.0))
        separator.backgroundColor = UIColor(red:0xEF/0xFF, green: 0xEF/0xFF, blue: 0xF4/0xFF, alpha: 1.0)
        contentView.addSubview(separator)
    }
}

class MyAcademicMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView : UITableView = UITableView()
    private let iconColors = [UIColor.red, UIColor.cyan, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.brown]
    private let textLabels = ["学校申请", "学校收藏夹", "成绩分析器", "抢课", "充值", "代课劵"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        self.initTableView()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = self.view.bounds
        tableView.backgroundColor = .white
        tableView.register(MyAcademicProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(MyAcademicStatsCell.self, forCellReuseIdentifier: "StatsCell")
        tableView.register(MyAcademicUtilitiesCell.self, forCellReuseIdentifier: "UtilitiesCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionSeperator = UIView(frame: CGRect(x:0.0, y:0.0, width: self.view.frame.size.width, height: 10.0))
        sectionSeperator.backgroundColor = UIColor(red:0xEF/0xFF, green: 0xEF/0xFF, blue: 0xF4/0xFF, alpha: 1.0)
        return sectionSeperator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return textLabels.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80.0
        case 1:
            return 56.0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! MyAcademicProfileCell
            cell.avatar.backgroundColor = .darkGray
            cell.nameLabel.text = "皮皮王"
            cell.subLabel.text = "查看个人主页或编辑资料"
            return cell
        case (0,1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath) as! MyAcademicStatsCell
            cell.statValues[0].text = "N/A"
            cell.statValues[1].text = "N/A"
            cell.statValues[2].text = "N/A"
            cell.statValues[3].text = "N/A"
            return cell
        case (1,0..<textLabels.count) :
            let cell = tableView.dequeueReusableCell(withIdentifier: "UtilitiesCell", for: indexPath) as! MyAcademicUtilitiesCell
            cell.utilityIcon.backgroundColor = iconColors[indexPath.row]
            cell.utilityNameLabel.text = textLabels[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            navigationController?.pushVC(MyProfileVC(), animated: true, hideTabBar: true)
        case (1,0):
            navigationController?.pushVC(ApplicationInfoVC(), animated: true, hideTabBar: true)
        default:
            return
        }
    }

}

