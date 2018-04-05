//
//  ApplicationInfoVC.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/1.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class ApplicationInfoCell : UITableViewCell {
    
    let itemField : UITextField = UITextField()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        accessoryType = .disclosureIndicator
        
        itemField.font = UIFont.systemFont(ofSize: 16.0)
        itemField.isEnabled = false
        contentView.addSubview(itemField)
        itemField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0)
            make.right.equalToSuperview().offset(-15.0)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

enum ApplicationItem : Int {
    case REGION, SCHOOL, PROGRAM
}

class ApplicationInfoVC : UIViewControllerWithSelection, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()
    
    let items = ["国家/地区", "学校", "专业"]
    
    var isRegionSelected  = false
    var isSchoolSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        title = "学校信息"
        initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.register(ApplicationInfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + (isRegionSelected ? 1 : 0) + (isSchoolSelected ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! ApplicationInfoCell
        cell.itemField.placeholder = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataPicker = IvoryTowerDataPicker()
        dataPicker.delegate = self
        dataPicker.item = indexPath.row
        dataPicker.title = items[indexPath.row]
        IvoryDataProvider.assignApplicationForSchoolData(dataPicker: dataPicker, forItem:ApplicationItem(rawValue: indexPath.row)!)
        navigationController?.pushViewController(dataPicker, animated: true)
    }
    
    override func handleSelection(selection: String, forItem: Int) {
        switch ApplicationItem(rawValue: forItem)! {
        case .REGION:
            updateRegionInfo(region: selection)
        case .SCHOOL:
            updateSchoolInfo(school: selection)
        case .PROGRAM:
            updateProgramInfo(program: selection)
        }
    }
    
    func updateRegionInfo(region: String) {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ApplicationInfoCell
        cell.itemField.text = region
        if (!isRegionSelected) {
            isRegionSelected = true
            tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .right)
        }
    }
    
    func updateSchoolInfo(school: String) {
        let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! ApplicationInfoCell
        cell.itemField.text = school
        if (!isSchoolSelected) {
            isSchoolSelected = true
            tableView.insertRows(at: [IndexPath(row: 2, section: 0)], with: .right)
        }
    }
    
    func updateProgramInfo(program: String) {
        let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! ApplicationInfoCell
        cell.itemField.text = program
    }
    
}
