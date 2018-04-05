//
//  IvoryTowerExtensions.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/30.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func pushVC(_ VC: UIViewController, animated: Bool, hideTabBar: Bool) {
        VC.hidesBottomBarWhenPushed = hideTabBar
        self.pushViewController(VC, animated: animated)
    }
    
}
