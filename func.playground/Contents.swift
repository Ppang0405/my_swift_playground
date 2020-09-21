import UIKit

var str = "Hello, playground"

#if swift(>=5.2)
print("Hello, Swift 5.2")
#elseif swift(>=5.1)
print("Hello, Swift 5.1")
#elseif swift(>=5.0)
print("Hello, Swift 5.0")
#elseif swift(>=4.1)
print("Hello, Swift 4.1")
#elseif swift(>=4.0)
print("Hello, Swift 4.0")
#elseif swift(>=3.0)
print("Hello, Swift 3.x")
#else
print("Hello, Swift 2.2")
#endif

func sayHello(first: String, whatever last: String) -> String {
    return "Hello \(first) \(last)"
}

func printName(given first: String, family last: String) -> String {
    return "Name: \(first), \(last)"
}

sayHello(first: "truong", whatever: "nguyen")
sayHello(first: "le", whatever: "dung")

printName(given: "chanh", family: "muoi")

// func return tuple // -> way to return more than 1 value
func findCenter(start:(y: Int, x: Int), _ end:(Int, Int)) -> (Int, Int) {
    let (xEnd, yEnd) = end
    let xCenter = start.y + (xEnd - start.y) / 2
    let yCenter = start.y + (yEnd - start.x) / 2
    return (xCenter, yCenter)
}

let center = findCenter(start: (1, 2), (5,6))

// default arguments
func concatenate(strings: [String], delimitedBy: String = ", ") -> String {
    var result = ""
    for word in strings {
        result += (word + delimitedBy)
    }
    return result
}

concatenate(strings: ["a", "b", "c"], delimitedBy: "\n")

// naming convention emerges
func sub(a: Int = 0, b: Int = 0) -> Int { return b - a }

sub()
sub(a: 20, b: 10) // order of arguments does not matter -> just call by external name
sub(a: 10)
sub(b: 10)

// spread in javascript, just have to same type
func sum(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(numbers: 1, 2, 3, 4)
var total = 0

func sum2(total: inout Int, _ numbers: Int...) -> Int {
    for number in numbers {
        total += number
    }
    return total
}

// in out func
enum Status {
    case success, failure
}

var name = "old"

// this fun wanna effect result in global scope, outside func and return 1 things
func doSomething( result: inout String) -> Status {
    result = "new value"
    return .success
}

doSomething(result: &name)

// other way -> return tuple has 2 things
func doSomething2() -> (status: Status, result: String) {
    return (.success, "new value")
}

// func within func
func sayHello() { print("Hello")}

var talk: () -> () = sayHello
//talk()

func speak(_ talk: () -> ()) {
    talk()
}

speak(sayHello)
