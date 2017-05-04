//: Playground - noun: a place where people can play

import Cocoa

// MARK: Ranges switch


//let anotherCharacter: Character = "a"
//
//switch anotherCharacter {
//case "a", "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
//
//let approximateCount = 62
//let countedThings = "moons orbiting Saturn"
//var naturalCount: String
//
//switch approximateCount {
//case 0:
//    naturalCount = "no"
//    
//case 1..<5:
//    naturalCount = "a few"
//    
//case 5..<12:
//    naturalCount = "several"
//    
//case 12..<100:
//    naturalCount = "dozens of"
//    
//case 100..<1000:
//    naturalCount = "hundreds of"
//    
//default:
//    naturalCount = "many"
//}
//
//print("There are \(naturalCount) \(countedThings)")

// MARK: Tuples switch

//let somePoint = (4, 2)
//
//switch somePoint {
//case (0, 0):
//    print("(0, 0) is at the origin")
//    
//case (_, 0):
//    print("(\(somePoint.0), 0) is on the x-axis")
//    
//case (0, _):
//    print("(0, \(somePoint.1)) is on the y-axis")
//    
//case (-2...2, -2...2):
//    print("(\(somePoint.0), \(somePoint.1)) is inside the box.")
//    
//default:
//    print("(\(somePoint.0), \(somePoint.1)) is outside the box.")
//}

//let anotherPoint = (2, 0)
//
//switch anotherPoint {
//case (let x, 0):
//    print("on the x-axis with an x value of \(x)");
//    
//case (0, let y):
//    print("on the y-axis with a y value of \(y)")
//    
//case let (x, y):
//    print("somewhere else at (\(x), \(y))")
//}

//let yetAnotherPoint = (-2, -2)
//
//switch yetAnotherPoint {
//case let (x, y) where x == y:
//    print("(\(x), \(y)) is on the line x == y")
//    
//case let (x, y) where x == -y:
//    print("(\(x), \(y)) is the line x == -y")
//    
//case let (x, y):
//    print("(\(x), \(y)) is just some arbitrary point")
//}


// Mark: Compound Cases

//let someCharacter: Character = "e"
//
//switch someCharacter {
//case "a", "e", "i", "o", "u":
//    print("\(someCharacter) is vowel")
//    
//case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
//     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y",
//     "z":
//    print("\(someCharacter) is a consonant")
//default:
//    print("\(someCharacter) is not a vowel or a consonant")
//}


//let stillAnotherPoint = (9, 0)
//
//switch stillAnotherPoint {
//case (let distance, 0), (0, let distance):
//    print("On an axis, \(distance) from the origin")
//default:
//    print ("Not on an axis")
//}


// Mark Control Transfert Statements

//let puzzleInput = "great minds think alike"
//var puzzleOutput = ""
//
//let characterToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
//
//for character in puzzleInput.characters {
//    if characterToRemove.contains(character) {
//        continue
//    } else {
//        puzzleOutput.append(character)
//    }
//}
//
//print(puzzleOutput)
//
//for i in 1...10 {
//    print(i)
//    if i == 7 {
//        break
//    }
//}



//let finalSquare = 25
//
//var board = [Int](repeating: 0, count: finalSquare + 1)
//
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//
//var square = 0
//var diceRoll = 0
//
//gameLoop: while square != finalSquare {
//    diceRoll += 1
//    
//    if diceRoll == 7 { diceRoll = 1 }
//    
//    switch square + diceRoll {
//    case finalSquare:
//        // diceRoll will move to the final square so game over
//        break gameLoop
//    
//    case let newSquare where newSquare > finalSquare:
//        // diceRoll will move us to beyond the final square so roll again.
//        continue gameLoop
//        
//    default:
//        // this is a valid move, so find out its effect
//        square += diceRoll
//        square += board[square]
//    }
//}
//
//print("Game Over!")

//func greet(person: [String: String]) {
//    guard let name = person["name"] else {
//        return
//    }
//    
//    print("Hello \(name)!")
//    
//    guard let location = person["location"] else {
//        print("I hope the weather is nice near you.")
//        return
//    }
//    
//    print("I hope the weather is nice in \(location).")
//}
//
//greet(person: ["name": "Jhon"])
//greet(person: ["name": "Jane", "location": "Cupertino"])



//func greet(person: String, alreadyGreeted: Bool) -> String {
//    
//    func greetAgain(person: String) -> String {
//        return "You're still there \(person)?"
//    }
//    
//    if alreadyGreeted {
//        return greetAgain(person: "Test")
//    } else {
//        return "Hello \(person)"
//    }
//}
//
//func sayHello() {
//    print("Say Hello!")
//}
//
//print(greet(person: "Bob", alreadyGreeted: true))

// Multiple Return

//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: [1, 3, 45, 56, 78])
//print("min is \(bounds.min) and max is \(bounds.max)")

//func somFunction(paramNoDef: Int, PramaWithDef: Int = 12) {}
//
//func arthmeticMean (_ numbers: Double...) -> Double {
//    var total: Double = 0
//    
//    for number in numbers {
//        total += number
//    }
//    
//    return total / Double(numbers.count)
//}
//
//arthmeticMean(1, 2, 3, 4, 5)
//
//func stepForward(_ input: Int) -> Int{
//    return input + 1
//}
//
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    return backward ? stepBackward : stepForward
//}
//
//var currentValue = 3
//
//let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
//
//print("Counting to zero")
//
//while currentValue != 0 {
//    print ("\(currentValue)... ")
//    currentValue = moveNearToZero(currentValue)
//}
//
//print("zero!")

//func chooseStepFunction(backward: Bool) -> (Int) -> Int{
//    func stepForward(_ input: Int) -> Int{
//        return input + 1
//    }
//
//    func stepBackward(_ input: Int) -> Int {
//        return input - 1
//    }
//
//    return backward ? stepBackward : stepForward
//    
//}
//
//var currentValue = 3
//
//let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
//
//print("Counting to zero")
//
//while currentValue != 0 {
//    print ("\(currentValue)... ")
//    currentValue = moveNearToZero(currentValue)
//}
//
//print("zero!")

//let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//func backward(_ s1: String, _ s2: String) -> Bool {
//    return s1 > s2
//}
//
//var reverseNames = names.sorted { $0 > $1 }
//
//let digitNames = [
//    0: "zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
//    5: "Five", 7: "Seven", 8: "Eignt", 9: "Nine"
//]
//let numbers = [16, 58, 510]
//
//let strings = numbers.map {(number) -> String in
//    var number = number
//    var output = ""
//    
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//    
//    return output
//}
//

func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrementer: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrementer: 7)
incrementBySeven()
incrementByTen()


let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler:  @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    
    func donSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNoneEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.donSomething()
print(instance.x)

completionHandlers.first?()

print(instance.x)

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }

print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)

func serve(customer cutomerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })

func serve2(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collectected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}































