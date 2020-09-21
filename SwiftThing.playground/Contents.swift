import UIKit

var str = "Hello, playground"

// assign to var or constant
let f = {(x: Int) -> Int in return x + 42}

f(3)
f(90)

// closures in an array (or a dictionary, or a set, etc...
let closures = [f,
{ (x:Int) -> Int in return x * 2 },
{ x in return x - 8 },
{ (x:Int) in x * x },
{ $0 * 42 }]

for fn in closures {
    fn(42)
}

let deepThought = { (question:String) in return "The answer to \"\(question)\" is \(7 * 6)!" }

deepThought("how old are you")


typealias IntMaker = () -> Int

func makeCounter() -> IntMaker {
    
    var n = 0
    
    // func within closure within func, and func and closures is the same thing
    func adder() -> Int {
        n = n + 1
        return n
    }
    return adder
}

let counter1 = makeCounter()
let counter2 = makeCounter()

counter1()
counter1()
counter1() // own closure has own capture lexical scope variable -> 2 closure will not effect the other.

counter2()
