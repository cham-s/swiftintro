//: Playground - noun: a place where people can play

import Cocoa

struct Resolution {
    var width = 0
    var height = 0
}

class ViewMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = ViewMode()

print("The width of someResolution is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280

print("The width of someResolution is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd

cinema.height = 2048

print(cinema.height)
print(hd.height)

let tenEighty = ViewMode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30.0

print("\(alsoTenEighty.frameRate)")

print(tenEighty === alsoTenEighty)

// Properties
struct FixedLengthRange {
    var firstValue: Int
    let legnth: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, legnth: 3)

rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, legnth: 4)

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0, depth = 0.0
}

struct Rect {
    var origin =  Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(), size: Size(width: 10.0, height: 10.0, depth: 0.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

print(square.center)
print(initialSquareCenter)

struct Cuboid {
    var size = Size()
    var volume: Double {
        return size.width * size.height * size.depth
    }
}

let fourByFiveByTwo = Cuboid(size: Size(width: 4.0, height: 5.0, depth: 2.0))

print(fourByFiveByTwo.volume)

// Properties Observers

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnum {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overreadableVomputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value."

print(SomeStructure.storedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // vap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)