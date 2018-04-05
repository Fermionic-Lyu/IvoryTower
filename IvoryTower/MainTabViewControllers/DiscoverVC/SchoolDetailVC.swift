//
//  SchoolDetailVC.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/4.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class SchoolDetailVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()
    
    var schoolInfo : SchoolInfo?
    
    let applicationAgents = ["新东方留学", "环球留学"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        title = schoolInfo?.schoolName
        initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.register(SchoolCell.self, forCellReuseIdentifier: "SchoolCell")
        tableView.register(IvoryTowerInfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AgentCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.delaysContentTouches = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let separator = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 10.0))
        separator.backgroundColor = HEXCOLOR(0xEFEFF4)
        return separator
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 0
        }
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return nil
        }
        let sectionHeader = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 55.0))
        let sectionTitle = UILabel(frame: CGRect(x: 15.0, y: 12.5, width: Constants.SCREEN_WIDTH, height: 30.0))
        sectionTitle.font = .boldSystemFont(ofSize: 18.0)
        switch section {
        case 1:
            sectionTitle.text = "联系中介"
        case 2:
            sectionTitle.text = "联系学长学姐"
        default:
            sectionTitle.text = ""
        }
        sectionHeader.addSubview(sectionTitle)
        let separator = UIView(frame: CGRect(x: 0.0, y: 54.0, width: Constants.SCREEN_WIDTH, height: 1.0))
        separator.backgroundColor = HEXCOLOR(0xEFEFF4)
        sectionHeader.addSubview(separator)
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            return 80.0
        case (0,1):
            return 45.0
        case (1,0..<applicationAgents.count):
            return 45.0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolCell
            cell.schoolIcon.image = UIImage(named: "\(schoolInfo!.schoolName)Icon")
            cell.schoolName.text = schoolInfo?.schoolName
            cell.schoolIntro.text = "排名：\(schoolInfo!.rank)   所在地：\(schoolInfo!.location)"
            return cell
        case (0,1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! IvoryTowerInfoCell
            cell.itemName.text = "官网:"
            cell.itemContent.text = schoolInfo?.website
            cell.setContentAsURL()
            return cell
        case (1,0..<applicationAgents.count):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AgentCell", for: indexPath)
            cell.textLabel?.text = applicationAgents[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
