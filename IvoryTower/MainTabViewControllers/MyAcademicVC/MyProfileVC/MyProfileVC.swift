//
//  MyProfileVC.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/29.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit
import SnapKit
import Charts

class MyProfileVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()
    
    let avatarView : UIImageView = UIImageView()
    let editAvatarBtn : UIButton = UIButton(type: UIButtonType.system)
    
    let myProfileAcademicInfoTitles = ["大学:", "专业:", "年级:"]
    let myProfileAcademicInfo = IvoryTowerManager.currentUser.academicInfo
    let myProfileRanks = ["2", "1", "34"]
    let myProfileCredits = IvoryTowerManager.currentUser.creditsInfo
    let myProfileTermInfos = IvoryTowerManager.currentUser.termInfos
    
    var gpaBarChartData : BarChartData {
        var dataEntries : [BarChartDataEntry] = []
        for (index,termInfo) in myProfileTermInfos.enumerated() {
            if let gpa = termInfo.termGPA {
                dataEntries.append(BarChartDataEntry(x: Double(index), y: gpa))
            }
        }
        let gpaDataSet = BarChartDataSet(values: dataEntries, label: "")
        gpaDataSet.colors = ChartColorTemplates.joyful()
        let gpaChartData = BarChartData(dataSet: gpaDataSet)
        gpaChartData.setValueFormatter(DefaultValueFormatter(decimals: 2))
        return gpaChartData
    }
    
    var gpaBarLabelFormatter : ChartStringFormatter {
        let labelFormatter = ChartStringFormatter()
        for terminfo in myProfileTermInfos {
            labelFormatter.nameValues.append(terminfo.termName)
        }
        return labelFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView() {
        title = "我"
        self.initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.register(MyProfileAvatarCell.self, forCellReuseIdentifier: "AvatarCell")
        tableView.register(IvoryTowerInfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(MyProfileGPACell.self, forCellReuseIdentifier: "GPACell")
        tableView.register(MyProfileRankCell.self, forCellReuseIdentifier: "RankCell")
        tableView.register(MyProfileCreditCell.self, forCellReuseIdentifier: "CreditCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CourseHistoryCell")
        tableView.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 20.0))
        tableView.separatorInset = UIEdgeInsetsMake(0.0, 15.0, 0.0, 15.0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delaysContentTouches = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,2,3,5:
            return 1
        case 1:
            return 3
        case 4:
            return myProfileTermInfos.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 190.0
        case 1,4,5:
            return 45.0
        case 2:
            return 200.0
        case 3:
            return 175.0
        default:
            return 0.0
        }
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
        guard section == 3 else {
            return 0.0
        }
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 3 else {
            return nil
        }
        let creditHeader = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 50.0))
        let creditLabel = UILabel()
        creditLabel.font = UIFont.init(name: "Helvetica", size: 34.0)
        creditLabel.text = "\(myProfileCredits!.currentCredits)/\(myProfileCredits!.creditsNeeded)"
        creditHeader.addSubview(creditLabel)
        creditLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20.0)
        }
        
        let creditTitle = UILabel()
        creditTitle.font = UIFont.systemFont(ofSize: 16.0)
        creditTitle.text = "学分"
        creditHeader.addSubview(creditTitle)
        creditTitle.snp.makeConstraints { (make) in
            make.left.equalTo(creditLabel.snp.right).offset(3.0)
            make.bottom.equalTo(creditLabel).offset(-6.0)
        }
        
        return creditHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath) as! MyProfileAvatarCell
            cell.avatarView.backgroundColor = UIColor.lightGray
            cell.nameLabel.text = "皮皮王"
            return cell
        case (1,0..<3):
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! IvoryTowerInfoCell
            cell.itemName.text = myProfileAcademicInfoTitles[indexPath.row]
            var itemContent : String?
            switch (indexPath.row) {
            case 0:
                itemContent = myProfileAcademicInfo?.universityName
            case 1:
                itemContent = myProfileAcademicInfo?.major
            case 2:
                itemContent = myProfileAcademicInfo?.year
            default:
                itemContent = ""
            }
            cell.itemContent.text = itemContent
            return cell
        case (2,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "GPACell", for: indexPath) as! MyProfileGPACell
            cell.gpaBarChart.data = gpaBarChartData
            cell.gpaBarChart.xAxis.valueFormatter = gpaBarLabelFormatter
            
            return cell
        case (3,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankCell", for: indexPath) as! MyProfileRankCell
            cell.ranks[0].text = myProfileRanks[0]
            cell.ranks[1].text = myProfileRanks[1]
            cell.ranks[2].text = myProfileRanks[2]
            return cell
        case (4,0..<myProfileTermInfos.count):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCell", for: indexPath) as! MyProfileCreditCell
            cell.termLabel.text = myProfileTermInfos[indexPath.row].termName
            if let credits = myProfileTermInfos[indexPath.row].termCredits {
                cell.creditLabel.text = String(credits)
            }
            return cell
        case (5,0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CourseHistoryCell", for: indexPath)
            cell.textLabel?.text = "课程历史"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }

    }
    
}
