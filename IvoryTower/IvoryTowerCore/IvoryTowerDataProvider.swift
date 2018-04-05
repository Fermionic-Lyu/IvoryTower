//
//  IvoryTowerDataProvider.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/2.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class IvoryDataProvider : NSObject {
    
    private static let alphabetUpper = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    private static let regions = ["北美", "欧洲", "大洋洲", "亚洲", "南极洲"]
    private static let countries = ["北美" : ["美国", "加拿大"],
                       "欧洲" : ["英国", "法国", "德国", "瑞士"],
                       "大洋洲" : ["澳大利亚", "新西兰"],
                       "亚洲" : ["日本", "韩国", "新加坡", "台湾", "香港"],
                       "南极洲" : ["南极"]]
    
    private static let states = ["卑诗省 British Columbia", "阿尔伯塔省 Alberta", "曼尼托巴省 Manitoba", "安大略省 Ontario", "魁北克省 Quebec"]
    private static let schools = ["卑诗省 British Columbia" : ["英属哥伦比亚大学", "西蒙菲莎大学"],
                   "阿尔伯塔省 Alberta" : ["阿尔伯塔大学", "卡尔加里大学"],
                   "曼尼托巴省 Manitoba" : ["曼尼托巴大学"],
                   "安大略省 Ontario" : ["多伦多大学", "渥太华大学", "皇后大学"],
                   "魁北克省 Quebec" : ["麦吉尔大学"]]
    
    private static let programs = ["Astronomy", "Biology", "Computing Science", "Chemistry", "Dental Science", "Economics", "French", "German", "History", "Industrial Design", "Japanese", "Korean", "Linguistic", "Mountain Studies", "Mathematics", "Neuroscience", "Ocean Studies", "Political Studies", "Physics", "Religon Studies", "Statistics", "Traditonal Studies", "Ukrainian", "Virology", "Xenobiology", "Zoology"]
    
    private static let schoolInfos : [SchoolInfo] = [("阿尔伯塔大学","3","加拿大-埃德蒙顿", "www.ualberta.ca"), ("多伦多大学","1","加拿大-多伦多", "www.utoronto.ca"), ("英属哥伦比亚大学","2","加拿大-温哥华", "www.ubc.ca"), ("麦吉尔大学","4","加拿大-蒙特利尔", "www.mcgill.ca")]
    
    static func assignApplicationForSchoolData(dataPicker: IvoryTowerDataPicker, forItem: ApplicationItem) {
        switch forItem{
        case .REGION:
            dataPicker.sectionTitles = regions
            dataPicker.data = countries
        case .SCHOOL:
            dataPicker.sectionTitles = states
            dataPicker.data = schools
        case .PROGRAM:
            dataPicker.sectionTitles = alphabetUpper
            for program in programs {
                if let firstLetter = program.first {
                    if dataPicker.data[String(firstLetter)] != nil {
                        dataPicker.data[String(firstLetter)]!.append(program)
                    } else {
                        dataPicker.data[String(firstLetter)] = [program]
                    }
                }
            }
        }
    }
    
    static func getSchoolInfos() -> [SchoolInfo] {
        return schoolInfos
    }
    
}
