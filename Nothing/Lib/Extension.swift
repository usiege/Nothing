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
        calendar.timeZone = TimeZone(identifier: "Asia/Shanghai")
        calendar.locale = Locale(identifier: "en_CN")
        
        return calendar
    }
    
    func year() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.year, from: self)
    }
    
    func month() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.month, from: self)
    }
    
    func day() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.day, from: self)
    }
    
    func hour() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.hour, from: self)
    }
    
    func minute() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.minute, from: self)
    }
    
    func second() -> Int {
        var calendar = self.customCalendar()
        
        return calendar.component(.second, from: self)
    }
}


extension String {
    func toDate() -> Date? {
        let formater = DateFormatter()
        formater.dateFormat = DATE_FORMAT
        
        return formater.date(from: self)
    }
    

}
