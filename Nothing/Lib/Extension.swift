//
//  File.swift
//  Nothing
//
//  Created by user on 2018/4/26.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

extension Date {
    func customCalendar() -> Calendar {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "Asia/Shanghai")!
        calendar.locale = Locale(identifier: "en_CN")
        
        return calendar
    }
    
    func year() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.year, from: self)
    }
    
    func month() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.month, from: self)
    }
    
    func day() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.day, from: self)
    }
    
    func hour() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.hour, from: self)
    }
    
    func minute() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.minute, from: self)
    }
    
    func second() -> Int {
        let calendar = self.customCalendar()
        
        return calendar.component(.second, from: self)
    }
}


extension String {
    
    func toDate() -> Date? {
        let formater = DateFormatter()
        formater.dateFormat = DATE_FORMAT
        formater.timeZone = TimeZone(secondsFromGMT: 8)
        formater.locale = Locale(identifier: "en_CN")
        
        return formater.date(from: self)
    }
    

}
