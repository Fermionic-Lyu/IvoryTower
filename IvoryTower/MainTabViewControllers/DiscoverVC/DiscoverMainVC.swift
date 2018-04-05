//
//  DiscoverMainVC.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/28.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class SchoolCell : UITableViewCell {
    
    let schoolIcon : UIImageView = UIImageView()
    let schoolName : UILabel = UILabel()
    let schoolIntro : UILabel = UILabel()
    let addToFolderBtn : UIButton = UIButton(type: .system)
    
    let schoolIconSize : CGFloat = 50.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        schoolIcon.clipsToBounds = true
        schoolIcon.layer.cornerRadius = schoolIconSize / 2
        contentView.addSubview(schoolIcon)
        
        schoolName.font = .systemFont(ofSize: 18.0)
        contentView.addSubview(schoolName)
        
        schoolIntro.font = .systemFont(ofSize: 14.0)
        schoolIntro.textColor = .lightGray
        contentView.addSubview(schoolIntro)
        
        addToFolderBtn.setTitle("+ 收藏", for: .normal)
        addToFolderBtn.setTitleColor(.blue, for: .normal)
        contentView.addSubview(addToFolderBtn)
        
        schoolIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0)
            make.top.equalToSuperview().offset(15.0)
            make.size.equalTo(schoolIconSize)
        }
        
        schoolName.snp.makeConstraints { (make) in
            make.left.equalTo(schoolIcon.snp.right).offset(10.0)
            make.top.equalToSuperview().offset(15.0)
        }
        
        schoolIntro.snp.makeConstraints { (make) in
            make.left.equalTo(schoolName)
            make.top.equalTo(schoolName.snp.bottom).offset(5.0)
        }
        
        addToFolderBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(schoolIcon)
            make.right.equalToSuperview().offset(-15.0)
        }
        
        selectionStyle = .none
    }
    
}

class DiscoverMainVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()
    let schoolInfos = IvoryDataProvider.getSchoolInfos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        self.view.backgroundColor = .white
        initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SchoolCell.self, forCellReuseIdentifier: "SchoolCell")
        tableView.tableHeaderView = initTableHeaderView()
        tableView.tableFooterView = UIView()
        tableView.delaysContentTouches = false
        tableView.separatorInset = UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)
    }
    
    func initTableHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 60.0))
        let searchField = UITextFieldWithPadding(frame: CGRect(x: 15.0, y: 15.0, width: Constants.SCREEN_WIDTH - 30.0, height: 30.0), padding: 15.0)
        searchField.placeholder = "搜索学校"
        searchField.layer.cornerRadius = 5.0
        searchField.layer.borderWidth = 0.5
        searchField.layer.borderColor = UIColor.lightGray.cgColor
        headerView.addSubview(searchField)
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolInfos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let separator = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.SCREEN_WIDTH, height: 10.0))
        separator.backgroundColor = HEXCOLOR(0xEFEFF4)
        return separator
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolCell
        let schoolInfo = schoolInfos[indexPath.row]
        cell.schoolIcon.image = UIImage(named: "\(schoolInfo.schoolName)Icon")
        cell.schoolName.text = schoolInfo.schoolName
        cell.schoolIntro.text = "排名：\(schoolInfo.rank)   所在地：\(schoolInfo.location)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(false)
        let schoolDetailVC = SchoolDetailVC()
        schoolDetailVC.schoolInfo = schoolInfos[indexPath.row]
        navigationController?.pushViewController(schoolDetailVC, animated: true)
    }
}
