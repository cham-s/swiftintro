//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var char = Character("b")

print(char.customPlaygroundQuickLook)
print(str.description)

let cafe = "Cafe\u{301}"
let cafe2 = "Café"

let truth = cafe == cafe2

var name: String
name = cafe2 + " " + cafe
name.append("\u{E9}\u{20DD}")

name.characters.count

let greeting = "Guten Tag!"
greeting[greeting.index(before: greeting.endIndex)]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I"

if quotation == sameQuotation {
    print("These string are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}"

if eAcuteQuestion == combinedEAcuteQuestion {
    print ("Strings are equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalA {
    print("Strings are not equivalent")
}

let dogString = "Dog!!🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}

// Array

var someInts = [Int]()

print("someInts is of the type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherTheeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherTheeDoubles

var shoppingList: [String] = ["Eggs", "Mild"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList

shoppingList[4...6] = ["Bannanas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]


let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

var letters = Set<Character>()

print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")

letters = []

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres.count) fovorite music genre.")

if favoriteGenres.isEmpty {
    print("Ad far as music goes, I'm not picky.")
} else {
    print("I have partircular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm overt it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits : Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNubers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNubers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNubers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

var namesOfINtegers = [Int: String]()

namesOfINtegers[16] = "sixteen"

namesOfINtegers = [:]

var airports = ["YYZ": "Toronto Peason", "DUB": "Dublin"]

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is in the airports dictionary.")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for index in 1...5 {
    print("\(index) times is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let finalSquare = 25

var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

//while square < finalSquare {
//    //roll the dice
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    // move by the rolled amount
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}

repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare

print ("Game Over")

var temperatureInFahreheit = 30

if temperatureInFahreheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

let someChar: Character = "z"

switch someChar {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}




