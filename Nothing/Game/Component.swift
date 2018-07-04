//
//  Component.swift
//  Nothing
//
//  Created by charles on 2018/6/24.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class DamageTaking : Component {
    var hitpoints : Int = 10
    
    func takeDamage(amount : Int) {
        hitpoints -= amount
    }
}

class MovingObject {
    func move(distance: Double) {
        
    }
}

//对游戏帧刷新时间感兴趣
//可能包括：视图控制器，SKScene，GLKViewController
class TimeKeeper {
    
    var lastFrameTime : Double = 0.0
    let someMovingObject = MovingObject()
    
}

/// CADisplayLink duration
// GLKViewController timeSinceLastUpdate
//这些属性会给出每帧耗时

//如何计算函数运行时间？

extension TimeKeeper {
    
    func update(currentTime : Double) {
        
        let deltaTime = currentTime - lastFrameTime
        let movementSpeed = 3.0
    
        someMovingObject.move(distance: movementSpeed * deltaTime)
        lastFrameTime = currentTime
    }
    
    func currentTime() -> Void {
    
        let currentTime = Date.timeIntervalSinceReferenceDate as Double
        print("current time: " + "\(currentTime)")
    }
    
    
    
}
