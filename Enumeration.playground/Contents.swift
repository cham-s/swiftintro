//: Playground - noun: a place where people can play

enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn,
         uranus, neptune
}

var directionHead = CompassPoint.west

directionHead = .east

directionHead = .south

switch directionHead {
case .north:
    print("Lots of planets have a north")
    
case .south:
    print("Watch out for penguins")
    
case .east:
    print("Where the sun rises")
    
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth

switch somePlanet{
case .earth:
    print("Modyly harmless")
    
default:
    print("Not safe for humans")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 456754, 51226, 3)
productBarcode = .qrCode("FGTYHNJUIKNH")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    
case .qrCode(let productCode):
    print("QR code: \(productBarcode)")
}

enum ASCIICOntroleCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let earthsOrder = Planet.earth.rawValue

let sunsetDirection = CompassPoint.west.rawValue

let possiblrPlanet = Planet(rawValue: 7)

let postionToFind = 11
if let somePlanet = Planet(rawValue: 11) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not habitable.")
    }
} else {
    print("There isn't a planet at this position")
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
        
    case let .addition(left, right):
        return(evaluate(left) + evaluate(right))
        
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))



