//: Playground - noun: a place where people can play

import Cocoa

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicyle: Vehicle {
    override init () {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicyle()

print("Bicycle: \(bicycle.description)")

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Steak")
let mysteryFood = Food()

print("meat: \(namedMeat.name) mystery: \(mysteryFood.name)")

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let onBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✅" : " ❌"
        
        return output
    }
}

var breakFastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Steak"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakFastList[0].name = "Orange juice"
breakFastList[0].purchased = true

for item in breakFastList {
    print(item.description)
}

let wholeNumber: Double = 12345.0
let pi = 3.13159

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was ninit with a species of \(giraffe.species)")
}

enum TemperatureUnitFirst {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
            
        case "C":
            self = .celsius
            
        case "F":
            self = .fahrenheit
            
        default:
            return nil
        }
    }
}

let farhenheitUnit = TemperatureUnitFirst(symbol: "F")

enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

if let fer = TemperatureUnit(rawValue: "F") {
    print("Yes")
}

class Product {
    let name: String
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CarItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CarItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity \(twoSocks.quantity)")
    
}

class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

struct ChessBoard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = ChessBoard()
print(board.squareIsBlackAt(row: 0, column: 1))

// Deinit

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank + coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)

print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")

print("There are now \(Bank.coinsInBank) left in the bank.")

playerOne!.win(coins: 2_000)
print("\(Bank.coinsInBank)")

print("\(playerOne!.coinsInPurse)")

playerOne = nil
print("Player has left the game")
print("\(Bank.coinsInBank)")
