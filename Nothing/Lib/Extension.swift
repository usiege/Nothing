//
//  File.swift
//  Nothing
//
//  Created by user on 2018/4/26.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

extension Date {
    
}


extension String {
    func toDate() -> Date? {
        let formater = DateFormatter()
        formater.dateFormat = DATE_FORMAT
        
        return formater.date(from: self)
    }
}
