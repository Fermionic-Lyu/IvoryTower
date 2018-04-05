//
//  IvoryTowerUI.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/4.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class UIViewControllerWithSelection : UIViewController {
    
    func handleSelection(selection:String, forItem:Int) {
        print("\(selection) is chosen for item \(forItem)")
    }
    
}

class UITextFieldWithPadding: UITextField {
    
    var padding : CGFloat?
    
    init(frame: CGRect, padding: CGFloat) {
        super.init(frame: frame)
        self.padding = padding
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if let pad = padding {
            return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0.0, pad, 0.0, pad))
        } else {
            return bounds
        }
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        if let pad = padding {
            return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0.0, pad, 0.0, pad))
        } else {
            return bounds
        }
    }
}

class IvoryTowerInfoCell : UITableViewCell {
    
    let itemName : UILabel = UILabel()
    let itemContent : UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCell() {
        itemName.frame = CGRect(x: 15.0, y: 0.0, width: 50.0, height: 45.0)
        itemName.font = UIFont.boldSystemFont(ofSize: 16.0)
        contentView.addSubview(itemName)
        
        itemContent.frame = CGRect(x: 65.0, y: 0.0, width: 200.0, height: 45.0)
        itemContent.font = UIFont.systemFont(ofSize: 16.0)
        itemContent.textColor = HEXCOLOR(0x4A4A4A)
        contentView.addSubview(itemContent)
        
        accessoryType = .disclosureIndicator
    }
    
    func setContentAsURL() {
        itemContent.textColor = .blue
    }
    
}
