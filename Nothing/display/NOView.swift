//
//  NOVIew.swift
//  Nothing
//
//  Created by user on 2018/4/26.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
import UIKit


protocol NOViewCallYou {
    
}

extension UIView {
    
    public func appear() {
        if self.isHidden == true {
            self.isHidden = false
        }
        //进入时的设置
        //向x y轴方向平移 0 0
        self.transform = CGAffineTransform(translationX: 0, y: 0)
        self.transform = CGAffineTransform(rotationAngle: 0)
        
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        //transform scale 改变中间不能添加其他变换
        //动画播放
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
//            self.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }, completion: nil)
//        UIView.animate(withDuration: , delay: , options: , animations: , completion: )
        
    }
    
    public func disappear() {
        if self.isHidden == true {
            self.isHidden = false
        }
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
//            self.alpha = 0.0
        }, completion: nil)
    }
}
