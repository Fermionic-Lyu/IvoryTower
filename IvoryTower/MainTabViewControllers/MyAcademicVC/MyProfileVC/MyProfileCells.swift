//
//  MyProfileCells.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/29.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit
import Charts

class MyProfileAvatarCell : UITableViewCell {
    
    let avatarView : UIImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    let editAvatarBtn : UIButton = UIButton(type: .system)
    
    static let AVATAR_WIDTH : CGFloat = 80.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        avatarView.frame = CGRect(x: (Constants.SCREEN_WIDTH - MyProfileAvatarCell.AVATAR_WIDTH)/2.0, y: 20.0, width: MyProfileAvatarCell.AVATAR_WIDTH, height: MyProfileAvatarCell.AVATAR_WIDTH)
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = MyProfileAvatarCell.AVATAR_WIDTH/2
        contentView.addSubview(avatarView)
        
        nameLabel.frame = CGRect(x: (Constants.SCREEN_WIDTH - 80.0)/2.0, y: MyProfileAvatarCell.AVATAR_WIDTH + 35.0, width: 80.0, height: 20.0)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        nameLabel.textAlignment = .center
        contentView.addSubview(nameLabel)
        
        editAvatarBtn.frame = CGRect(x: (Constants.SCREEN_WIDTH - 110.0)/2.0, y: MyProfileAvatarCell.AVATAR_WIDTH + 70.0, width: 110.0, height: 25.0)
        editAvatarBtn.backgroundColor = UIColor.darkGray
        let attributedTitle = NSAttributedString(string: "修改头像", attributes:[NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13.0)])
        editAvatarBtn.setAttributedTitle(attributedTitle, for: .normal)
        editAvatarBtn.layer.cornerRadius = 5.0
        contentView.addSubview(editAvatarBtn)
        
        selectionStyle = .none
    }
}

class MyProfileGPACell : UITableViewCell {
    
    let gpaBarChart = BarChartView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        selectionStyle = .none
        
        gpaBarChart.rightAxis.enabled = false
        gpaBarChart.xAxis.drawGridLinesEnabled = false
        gpaBarChart.xAxis.labelPosition = .bottom
        gpaBarChart.xAxis.labelFont = .systemFont(ofSize: 13.0)
        gpaBarChart.xAxis.setLabelCount(4, force: false)
        gpaBarChart.leftAxis.axisMinimum = 0.0
//        gpaBarChart.leftAxis.axisMaximum = 4.0
        gpaBarChart.leftAxis.setLabelCount(4, force: false)
        gpaBarChart.leftAxis.valueFormatter = YAxisValueFormatter()
        gpaBarChart.doubleTapToZoomEnabled = false
        gpaBarChart.chartDescription?.enabled = false
        gpaBarChart.legend.enabled = false
        gpaBarChart.animate(yAxisDuration: 1.5, easingOption: .easeInOutExpo)
    
        contentView.addSubview(gpaBarChart)
        gpaBarChart.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(15.0)
            make.bottom.equalToSuperview().offset(-15.0)
        }
    }
    
}

class MyProfileRankCell : UITableViewCell {
    
    var ranks : Array<UILabel> = []
    let rankTitles = ["好友排名", "专业排名", "全校排名"]
    
    static let RANK_WIDTH : CGFloat = 90.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var spacing : CGFloat {
        return Constants.SCREEN_WIDTH/3 - MyProfileRankCell.RANK_WIDTH
    }
    
    func initCell() {
        for (index, title) in rankTitles.enumerated() {
            let titleLabel = UILabel(frame: CGRect(x: Constants.SCREEN_WIDTH/3 * CGFloat(index), y: 25.0, width: Constants.SCREEN_WIDTH/3, height: 20.0))
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            titleLabel.text = title
            titleLabel.textAlignment = .center
            contentView.addSubview(titleLabel)
            
            let rank = UILabel(frame: CGRect(x: (CGFloat(index)+0.5)*spacing + MyProfileRankCell.RANK_WIDTH * CGFloat(index), y: 55.0, width: MyProfileRankCell.RANK_WIDTH, height: MyProfileRankCell.RANK_WIDTH))
            rank.font = UIFont.boldSystemFont(ofSize: 34.0)
            rank.textAlignment = .center
            rank.clipsToBounds = true
            rank.layer.cornerRadius = MyProfileRankCell.RANK_WIDTH/2
            rank.layer.borderWidth = 5.0
            rank.layer.borderColor = UIColor.gray.cgColor
            ranks.append(rank)
            contentView.addSubview(rank)
        }
    }
    
}

class MyProfileCreditCell: UITableViewCell {
    
    let termLabel : UILabel = UILabel()
    let creditLabel : UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        termLabel.frame = CGRect(x: 15.0, y: 0.0, width: 150.0, height: 45.0)
        termLabel.textColor = UIColor.lightGray
        termLabel.font = UIFont.systemFont(ofSize: 16.0)
        contentView.addSubview(termLabel)
        
        creditLabel.frame = CGRect(x: Constants.SCREEN_WIDTH - 45.0, y: 0.0, width: 30.0, height: 45.0)
        creditLabel.font = UIFont.systemFont(ofSize: 16.0)
        contentView.addSubview(creditLabel)
    }
    
}
