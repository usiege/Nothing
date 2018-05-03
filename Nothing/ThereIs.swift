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
    
    public var something: [String: ()->()]?
    
    public func maybe(noDate: NODate, _ some: () -> ()) -> ThereIs {
        switch noDate {
        case let .April(date):
            let myDate = date.toDate()
            let currentDate = Date()
            if let myDate = myDate {
                if myDate.compare(currentDate) == .orderedSame {
                    some()
                }
            }
        }
        return self
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
