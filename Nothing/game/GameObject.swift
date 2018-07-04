//
//  GameObject.swift
//  Nothing
//
//  Created by charles on 2018/6/24.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation


class Component: NSObject {

    var gameObject : GameObject?
    func update(deltaTime : Float) {
        
    }
}

class GameObject {
    
    var canPause = true
    var components : [Component] = []
    
    func add(component : Component) {
        components.append(component)
        component.gameObject = self
    }

    func remove(component : Component) {
        if let index = components.index(where: { $0 === component}) {
            component.gameObject = nil
            components.remove(at: index)
        }
    }
    

    func update(deltaTime : Float) {
        
        for component in self.components {
            component.update(deltaTime: deltaTime)
        }
        
    }
    
    func findComponent<T: Component>() -> T?{
        for component in self.components {
            if let theComponent = component as? T {
                return theComponent
            }
        }
        return nil;
    }
    

    func findComponents<T: Component>() -> [T?] {

        var foundComponents : [T] = []
        
        for component in self.components {
            if let theComponent = component as? T {
                foundComponents.append(theComponent)
            }
        }
        
        return foundComponents
    }
    
    
    
    
}
