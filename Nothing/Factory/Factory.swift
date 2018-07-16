//
//  Factory.swift
//  Nothing
//
//  Created by user on 2018/7/5.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

protocol UIFactory {
    func createView(calssObject: AnyClass, cure: (AnyObject) -> ()) -> UIView
}


//func ddd {
//    let table = UITableView()
//    table.register(AnyClass?, forCellReuseIdentifier: <#T##String#>)
//}
