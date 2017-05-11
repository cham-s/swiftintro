//: Playground - noun: a place where people can play

import Cocoa

class Appartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person?
    deinit {
        print("Appartment \(unit) is being deinitialized")
    }
}

class Person {
    let name: String
    
    init(name: String) { self.name = name    }
    var appartment: Appartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Jhon")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

var jhon: Person?
var unit4A: Appartment?

jhon = Person(name: "Varda")
unit4A = Appartment(unit: "4A")

jhon!.appartment = unit4A
unit4A!.tenant = jhon

jhon = nil
unit4A = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var bill: Customer?

bill = Customer(name: "Billy")
bill!.card = CreditCard(number: 1234_5678_9012_3456, customer: bill!)

bill = nil

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Otawa")

print("\(country.name) and \(country.capitalCity.name)")

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil