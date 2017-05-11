//: Playground - noun: a place where people can play

import Cocoa

class Appartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person?
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
