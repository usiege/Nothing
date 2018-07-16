//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

//: [Next](@next)
//@asmname("println") func c_println() -> Int
//reinterpretCast<T, U>(T) -> U

class Pokemon: CustomDebugStringConvertible {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var debugDescription: String { return  "< Pokemon \(name) >" }
    deinit {
        print("\(self) escaped!")
    }
}

func delay(seconds: TimeInterval, closure: @escaping ()->()) {
//    print("queue:-----> \(DispatchQueue.main)")

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
        print("🕑")
        closure()
    })
    
//    print("time:-----> \(DispatchTime.now())")
}

func closure(_ c: @escaping ()->()) {
    c();
}

func demo1() {
    print(#function)
    let pokemon = Pokemon(name: "Mewtwo")
    print("before closure: \(pokemon)")
    
    delay(seconds: 1) {
        print("inside closure: \(pokemon)")
    }
    
    print("bye")
}
//demo1()

func demo2() {
    print(#function)
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon)")
    delay(seconds: 1) {
        print("inside closure: \(pokemon)")
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon)")
}

//demo2()

//被捕获变量在执行时才取值
func demo3() {
    print(#function)
    var value = 42
    print("before closure: \(value)")
    delay(seconds: 1) {
        print("inside closure: \(value)")
    }
    value = 1337
    print("after closure: \(value)")
}

//demo3()

//修改捕获的变量
func demo4() {
    print(#function)
    var value = 42
    print("before closure: \(value)")
    delay(seconds: 1) {
        print("inside closure 1, before change: \(value)")
        value = 1337
        print("inside closure 1, after change: \(value)")
    }
    delay(seconds: 2) {
        print("inside closure 2, \(value)")
    }
}

//demo4()

//捕获一个变量作为常量拷贝
func demo5() {
    print(#function)
    var value = 42
    print("before closure: \(value)")
    delay(seconds: 1) { [ constValue = value ] in
        print("inside closure: \(constValue)")
    }
    value = 1337
    print("after closure: \(value)")
}

//demo5()

func demo6() {
    print(#function)
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon)")
    delay(seconds: 1) { [ pokemon = pokemon ] in
        print("inside closure: \(pokemon)")
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon)")
}

//demo6()

//与demo6等价
func demo6_equivalent() {
    print(#function)
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon)")
    let pokemonCopy = pokemon
    delay(seconds: 1) {
        print("inside closure: \(pokemonCopy)")
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon)")
}

//demo6_equivalent()

func demo7() {
    var pokemon = Pokemon(name: "Mew")
    print("➡️ Initial pokemon is \(pokemon)")
    
    delay(seconds: 1) { [ capturedPokemon = pokemon ] in
        print("closure 1 — pokemon captured at creation time: \(capturedPokemon)")
        print("closure 1 — variable evaluated at execution time: \(pokemon)")
        pokemon = Pokemon(name: "Pikachu")
        print("closure 1 - pokemon has been now set to \(pokemon)")
    }
    
    pokemon = Pokemon(name: "Mewtwo")
    print("🔄 pokemon changed to \(pokemon)")
    
    delay(seconds: 2) { [capturedPokemon = pokemon] in
        print("closure 2 — pokemon captured at creation time: \(capturedPokemon)")
        print("closure 2 — variable evaluated at execution time: \(pokemon)")
        pokemon = Pokemon(name: "Charizard")
        print("closure 2 - value has been now set to \(pokemon)")
    }
}

//demo7()

func demo8() {
    var pokemon = Pokemon(name: "Mew")
    print("➡️ Initial pokemon is \(pokemon)")
    closure {
        pokemon = Pokemon(name: "Charizard")
        print("pokemon is \(pokemon)")
    }
    pokemon = Pokemon(name: "SKL jet!")
    print("pokemon is \(pokemon)")
}

demo8()
