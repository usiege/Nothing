//
//  Extension+Button.swift
//  Nothing
//
//  Created by user on 2018/7/3.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

extension UIButton {
    class func xxx_swizzleSendAction() {
        struct xxx_swizzleToken {
            static var onceToken: Void = {
                let cls: AnyClass! = UIButton.self
                
                let originalSelector = #selector(sendAction(_:to:for:))
                let swizzleSelector = #selector(xxx_sendAction(action:to:forEvent:))
                
                let originalMethod = class_getInstanceMethod(cls, originalSelector)
                let swizzledMethod = class_getInstanceMethod(cls, swizzleSelector)
                
                method_exchangeImplementations(originalMethod!, swizzledMethod!)
            }()
        }
    }
    
    func sendAction(action: Selector, to: AnyObject!, forEvent: UIEvent!) {
        print("origin sendAction")
    }
    
    @objc
    func xxx_sendAction(action: Selector, to: AnyObject!, forEvent: UIEvent!) {
        print("I want instead it!")
        xxx_sendAction(action: action, to: to, forEvent: forEvent)
    }
}

extension UIButton {
    
}
