//
//  IvoryTowerManager.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/3.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class IvoryTowerManager : NSObject {
    
    static let currentUser = IvoryTowerUser(userId: "IT2018")
    
    static func didFinishLaunchingWithOptions(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        fetchCurrentUserData()
    }
    
    static func fetchCurrentUserData() {
        currentUser.fetchUserInfo(username: "皮皮王", academicInfo: ("阿尔伯塔大学", "工业设计", "大四"), creditsInfo: (68, 120), termInfos: [("2017 Winter", 4.0, 20),("2017 Fall", 3.65, 20),("2018 Winter", 3.72, 18),("2018 Spring", 3.50, 6)])
    }
    
}
