//
//  ThereIs.swift
//  Nothing
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

class ThereIs {
    
    init() {
        
    }
    
    deinit {
        
    }
    
    public var today: NODate?
    public var something: [String: ()->()]?
    
    func printPointer() {
        print(withUnsafePointer(to: &self.something, {
            print("\($0)")
        }))
    }
    
    public func maybe(noDate: NODate, _ some: () -> ()) -> ThereIs {
    
        //测试
        assert(self.today != nil, "Please set noDate for vc !")
        if noDate == self.today! {
            some()
            return self
        }
        
        
        ///正式使用
        switch noDate {
        case let .Date(date):
            let disposedDate = date.toDate()
            
            if let myDate = disposedDate {
                if isCurrentDate(date: myDate) {
                    some()
                }
            }
        }
    
        return self
    }
    
    private func isCurrentDate(date: Date) -> Bool {
        let currentDate = Date()
        if date.year() == currentDate.year() {
            if date.month() == currentDate.month() {
                if date.day() == currentDate.day() {
                    return true
                }
            }
        }
        return false
    }
    
    public func maybe(param: [String: Any], _ some: ()->() ) -> ThereIs {
        return self
    }
    
    public func maybe(noDate: NODate?, param: [String: Any], _ some: ()->() ) -> ThereIs {
        return self
    }

    
    
    public func nothing() -> ThereIs {
        return self
    }
    
}
