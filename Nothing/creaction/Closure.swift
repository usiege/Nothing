//
//  Closure.swift
//  Nothing
//
//  Created by user on 2018/5/24.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

extension Array {
    
    func filterUsingReduce(includeElement: (Element) -> Bool) -> [Element] {
        return reduce(initial: []) { (result, x) in
            includeElement(x) ? result + [x] : result
        }
    }
    
    func mapUsingReduce<T>(transform: (Element) -> T) -> [T] {
        return reduce(initial: []) {
            result,x in
            return result + [transform(x)]
        }
    }
}

class Reduce {
    
    func flatten<T>(xss: [[T]]) -> [T] {
        var result: [T] = []
        for xs in xss {
            result += xs
        }
        return result
    }
    
    func flattenUsingReduce<T>(xss: [[T]]) -> [T] {
        return xss.reduce(initial: [], combine: { result, xs in result + xs })
    }
    
    //--------------------
    
    func concatenateUsingReduce(xs: [String]) -> String {
        return xs.reduce(initial: "", combine: +)
    }
    
    func produceUsingReduce(xs: [Int]) -> Int {
        return xs.reduce(initial: 1, combine: *)
    }
    
    func sumUsingResuce(xs: [Int]) -> Int {
        return xs.reduce(0, { (result, x) in
            result + x
        })
    }
    
    //--------------------
    
    func prettyPrintArray(xs: [String]) -> String {
        var result: String = "Entries in the array xs:\n"
        for x in xs {
            result = " " + result + x + "\n"
        }
        return result
    }
    
    func concatenate(xs: [String]) -> String {
        var result: String = ""
        for x in xs {
            result += x
        }
        return result
    }
    
    func produce(xs: [Int]) -> Int {
        var result: Int = 0
        for x in xs {
            result = x * result
        }
        return result
    }
    
    func sum(xs: [Int]) -> Int {
        var result: Int = 0
        for x in xs {
            result += x
        }
        return result
    }
}

class Filter {
    
    func getSwiftFiles2(files: [String]) -> [String] {
        return files.filter({ (file) -> Bool in
            file.hasSuffix(".swift")
        })
    }
    
    func getSwiftFiles(files: [String]) -> [String] {
        var result: [String] = []
        for file in files {
            if file.hasSuffix(".swift") {
                result.append(file)
            }
        }
        return result
    }
}


extension Array {
    
    func reduce<T>(initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
    
    func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        var result: [Element] = []
        for x in self where try isIncluded(x) {
            result.append(x)
        }
        return result
    }
    
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result: [T] = []
        for x in self {
            result.append(try transform(x))
        }
        return result
    }
}

class Map {
    
    func genericComputeArray<T>(xs: [Int], transform: (Int) -> T) -> [T] {
        return xs.map(transform)
    }
    
    //-----------------------------------
    
    func map<Element, T>(xs: [Element], transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for x in xs {
            result.append(transform(x))
        }
        return result
    }
    
    func genericComputeArray1<T>(xs: [Int], transform: (Int) -> T) -> [T] {
        var result: [T] = []
        for x in xs {
            result.append(transform(x))
        }
        return result
    }
    
    func computeBoolArray(xs: [Int], transform: (Int) -> Bool) -> [Bool] {
        var result: [Bool] = []
        for x in xs {
            result.append(transform(x))
        }
        return result
    }
    
    
    /*  //这是一个错误的例子
     func isEvenArray(xs: [Int]) -> [Bool] {
     computeInArrray(xs: xs) { (x) -> Int in
     x % 2 == 0
     }
     }
     */
    
    func doubleArray2(xs: [Int]) -> [Int] {
        return computeInArrray(xs: xs, transform: { (x) -> Int in
            x * 2
        })
    }
    
    func computeInArrray(xs: [Int], transform: (Int) -> Int) -> [Int] {
        var result: [Int] = []
        for x in xs {
            result.append(transform(x))
        }
        return result
    }
    
    //-----------------------------------
    
    func doubleArray1(xs: [Int]) -> [Int] {
        var result: [Int] = []
        for x in xs {
            result.append(x * 2)
        }
        return result
    }
    
    func incrementArray(xs: [Int]) -> [Int] {
        var result: [Int] = []
        for x in xs {
            result.append(x)
        }
        return result
    }
}

