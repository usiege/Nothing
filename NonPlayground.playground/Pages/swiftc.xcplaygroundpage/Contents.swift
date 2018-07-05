//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//@asmname("println") func c_println() -> Int
//reinterpretCast<T, U>(T) -> U

class Pokemon: CustomDebugStringConvertible {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var debugDescription: String { return  "<Pokemon \(name)>" }
    deinit {
        print("\(self) escaped!")
    }
}

func delay(seconds: TimeInterval, closure: @escaping ()->()) {
//    let time = dispatch_time_t(bitPattern: Int64(seconds * Double(NSEC_PER_SEC))
//    print("closure")
    print(DispatchQueue.main)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
        print("🕑")
        closure()
    })
    
    print(DispatchTime.now())
}

func demo1() {
    let pokemon = Pokemon(name: "Mewtwo")
    print("before closure: \(pokemon)")
    
    delay(seconds: 1) {
        print("inside closure: \(pokemon)")
    }
    
    print("bye")
}

demo1()
