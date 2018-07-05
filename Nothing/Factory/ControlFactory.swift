//
//  ControlFactory.swift
//  Nothing
//
//  Created by user on 2018/7/5.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

class ControlFactory: UIFactory {
    
    
    class func createButton(frame: CGRect, action: Selector, attribute:(UIButton)->()) -> UIButton {
        let button = UIButton.init(frame: frame)
        //默认属性
        
        button.addTarget(self, action: action, for: .touchUpOutside)
        //外部修改
        attribute(button)
        return button
    }
    
}
