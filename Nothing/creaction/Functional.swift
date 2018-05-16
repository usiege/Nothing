//
//  Functional.swift
//  Nothing
//
//  Created by user on 2018/5/16.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
import UIKit

typealias Position = CGPoint
typealias Distance = CGFloat

typealias Region = (Position) -> Bool

/*
 The way we’ve defined the Region type does have its disadvantages. In particular, we cannot inspect how a region was constructed: Is it com- posed of smaller regions? Or is it simply a circle around the origin? The only thing we can do is to check whether a given point is within a region or not. If we would want to visualize a region, we would have to sample enough points to generate a (black and white) bitmap.
 */
//最终inRange版本
func inRange(ownPosition: Position, target: Position, friendly: Position, range: Distance) -> Bool {
    let rangeRegion = difference(region: circle(radius: range), minusRegion: circle(radius: minimumDistance))
    let targetRegion = shift(offset: ownPosition, region: rangeRegion)
    let friendlyRegion = shift(offset: friendly, region: circle(radius: minimumDistance))
    let resultRegion = difference(region: targetRegion, minusRegion: friendlyRegion)
    
    return resultRegion(target)
}


//functions
func circle(radius: Distance) -> Region {
    return { position in
        sqrt(pow(position.x, 2.0) + pow(position.y, 2.0)) <= radius //这不加 return竟然也可以
    }
}

func shift(offset: Position, region: @escaping Region) -> Region {
    return { position in
        return region(Position(x: position.x + offset.x, y: position.y + offset.y))
    }
}

func invert(region: @escaping Region) -> Region {
    return { position in
        !region(position)
    }
}

func intersection(region1: Region, region2: Region) -> Region {
    return { point in
        region1(point) && region2(point)
    }
}

func union(region1: Region, region2: Region) -> Region {
    return { point in
        region1(point) && region2(point)
    }
}

func difference(region: Region, minusRegion: Region) -> Region {
    return intersection(region1: region, region2: invert(region: minusRegion))
}



//下面的range1-4，太过臃肿了，需要重构了
func inRange1(target: Position, range: Distance) -> Bool {
    return sqrt(target.x * target.x + target.y * target.y) <= range
}

func inRange2(target: Position, ownPosition: Position, range: Distance) -> Bool {
    let dx = ownPosition.x - target.x
    let dy = ownPosition.y - target.y
    let targetDistance = sqrt(pow(dx, 2.0) + pow(dy, 2.0))
    
    return targetDistance <= range
}

let minimumDistance: Distance = 2.0
func inRange3(target: Position, ownPosition: Position, range: Distance) -> Bool {
    let dx = ownPosition.x - target.x
    let dy = ownPosition.y - target.y
    let targetDistance = sqrt(pow(dx, 2.0) + pow(dy, 2.0))
    
    return targetDistance <= range && targetDistance >= minimumDistance
}

func inRange4(target: Position, ownPosition: Position, friendly:Position, range: Distance) -> Bool {
    let dx = ownPosition.x - target.x
    let dy = ownPosition.y - target.y
    let targetDistance = sqrt(dx * dx + dy * dy)
    
    let friendlyDx = friendly.x - target.x
    let friendlyDy = friendly.y - target.y
    let friendlyDistance = sqrt(pow(friendlyDx, 2.0) + pow(friendlyDy, 2.0))
    return targetDistance <= range
        && targetDistance >= minimumDistance
        && friendlyDistance >= minimumDistance
}


