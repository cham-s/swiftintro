//: Playground - noun: a place where people can play

import Cocoa

class Person {
    var residence: Residence?
}

//class Residence {
//    var numberOfRooms = 1
//}
//
//let don = Person()
//don.residence = Residence()
//if let roomCount = don.residence?.numberOfRooms {
//    print("numbers of room \(roomCount)")
//} else {
//    print("Unable to retrive the number of room")
//}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of roomsis \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let bill = Person()

if let roomCount = bill.residence?.numberOfRooms {
    print("Bill's residence has \(roomCount) room(s).")
} else {
    print("Unable to retirive the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"


func createAddress() -> Address {
    print("Funtion was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

bill.residence?.address = createAddress()

if bill.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It wasn't possible to print the number of rooms")
}

if let firstRoomName = bill.residence?[0].name {
    print("The name of the first room is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

let billHouse = Residence()
billHouse.rooms.append(Room(name: "Living Room"))
billHouse.rooms.append(Room(name: "Kitchen"))

bill.residence = billHouse

let theAddress = Address()
theAddress.buildingName = "The Larches"
theAddress.street = "Laurel Street"
bill.residence?.address = theAddress

if let address = bill.residence?.address?.street {
    print("The street is \(address)")
} else {
    print("Unable to retirive the address.")
}

if let buildingID = bill.residence?.address?.buildingIdentifier() {
    print("The id is: \(buildingID)")
}


