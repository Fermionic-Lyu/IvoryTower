//
//  IvoryTowerUser.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/2.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import Foundation

class IvoryTowerUser : NSObject {
    
    var userId : NSString
    var username : NSString?
    var academicInfo : AcademicInfo?
    var creditsInfo : CreditsInfo?
    var termInfos : [TermInfo] = []
    
    init(userId: NSString) {
        self.userId = userId
    }
    
    func fetchUserInfo(username: NSString, academicInfo: AcademicInfo, creditsInfo: CreditsInfo, termInfos: [TermInfo]) {
        self.username = username
        self.academicInfo = academicInfo
        self.creditsInfo = creditsInfo
        self.termInfos = termInfos
    }
    
}
