//: Playground - noun: a place where people can play

import Cocoa

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.increment(by: 5)
counter.reset()

//struct Point {
//    var x = 0.0, y = 0.0
//    func isTotheRightOf(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//
//let somePoint = Point(x: 4.0, y: 5.0)
//
//if somePoint.isTotheRightOf(x: 1.0) {
//    print("The point is to the right")
//}


struct Point {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

print(somePoint)

enum TriStateSwitch {
    case off, low, high
    
    mutating func next () {
        switch self {
        case .off:
            self = .low
            
        case .low:
            self = .high
            
        case .high:
            self = .off
        }
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advanve(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advanve(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Agryos")
player.complete(level: 1)
print(LevelTracker.highestUnlockedLevel)

player = Player(name: "Beto")

if player.tracker.advanve(to: 6) {
    print("Player is not in level 6")
} else {
    print("level 6 has not yet been unlocked")
}

