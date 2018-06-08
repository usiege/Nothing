//
//  DateConst.swift
//  Nothing
//
//  Created by user on 2018/4/26.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

let DATE_FORMAT = "YYYY-MM-dd"

enum NODate: Equatable {
    
    static func ==(lhs: NODate, rhs: NODate) -> Bool {
//        if let lhs(ld) && rhs(rd) {
//            if ld == rd {
//                return true
//            }
//        }
        return false
    }
    
    case Date(String)
    
}

//June
let JUNE_01_2018 = "2018-06-01"
let JUNE_03_2018 = "2018-06-03"     //添加了cocos2dx-lua工程

// May
let MAY_17_2018 = "2018-05-17"  
let MAY_16_2018 = "2018-05-16"
// April
let APRIL_26_2018 = "2018-04-26"
let APRIL_27_2018 = "2018-04-27"    //这个格式转日期会有这样的结果 2001-01-01 00:00:00 UTC

