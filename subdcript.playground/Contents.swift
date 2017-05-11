//: Playground - noun: a place where people can play

import Cocoa

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && columns >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// Inheritence

class Vehicule {
    var currentSpeed = 0.0
    var description: String {
        return "Travaling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // Do nothing
    }
}

let someVehicule = Vehicule()

print("Vehicule: \(someVehicule.description)")

class Bicycle: Vehicule {
    var hasBasket = false
}

let bicycle = Bicycle()

bicycle.hasBasket = true
bicycle.currentSpeed = 15.0

print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()

tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

print("Tandem: \(tandem.description)")


class Train: Vehicule {
    override func makeNoise() {
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicule {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// Initializers

struct Ferenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

var f = Ferenheit()

print(f.temperature)

struct Celsius {
    var temperatureInCelcius: Double
    
    init(fomFahrenheit fahrenheit: Double ) {
        temperatureInCelcius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelcius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelcius = celsius
    }
}

let boilingPointOfWater = Celsius(fomFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

let bodyTemperature = Celsius(37.0)

class SurveyQuestion {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

struct Size {
    var width = 0.0, height = 0.0
}

let twoBytwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

