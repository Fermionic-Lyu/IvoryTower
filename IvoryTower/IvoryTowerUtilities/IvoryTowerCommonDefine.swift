//
//  IvoryTowerCommonDefine.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/29.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit
import Charts

typealias SchoolInfo = (schoolName:String, rank:String, location:String, website:String)
typealias AcademicInfo = (universityName:String, major:String, year:String)
typealias CreditsInfo = (currentCredits:Int, creditsNeeded:Int)
typealias TermInfo = (termName:String, termGPA:Double?, termCredits:Int?)

struct Constants {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
}

func HEXCOLOR(_ hex: UInt32) -> UIColor? {
    let red : CGFloat = CGFloat(hex >> 16 & 0xFF) / 0xFF
    let green : CGFloat = CGFloat(hex >> 8 & 0xFF) / 0xFF
    let blue : CGFloat = CGFloat(hex & 0xFF) / 0xFF
    let alpha : CGFloat = hex > 0xFFFFFF ? CGFloat(hex >> 24 & 0xFF) / 0xFF : 1.0
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

class ChartStringFormatter : NSObject, IAxisValueFormatter {
    
    var nameValues : [String]! = []
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(describing: nameValues[Int(value)])
    }
}

class YAxisValueFormatter : NSObject, IAxisValueFormatter {
    
    let numberFormatter : NumberFormatter = NumberFormatter()
    
    override init() {
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumIntegerDigits = 1
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return numberFormatter.string(from: NSNumber(floatLiteral: value))!
    }
}
