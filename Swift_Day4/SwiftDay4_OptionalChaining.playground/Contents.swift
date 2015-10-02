//: Playground - noun: a place where people can play

import UIKit

// an optional variable
var maybeString: String?   // defaults to nil
maybeString = nil          // can be assigned a nil value
maybeString = "fish"       // can be assigned a value

// unwrapping an optional
if let unwrappedString = maybeString {
    // unwrappedString is a String rather than an optional String
    print(unwrappedString.hasPrefix("f")) // "true"
} else {
    print("maybeString is nil")
}

// forced unwrapping - will fail at runtime if the optional is nil
if maybeString!.hasPrefix("f") {
    print("maybeString starts with 'f'")
}

// optional chaining, returning an optional with the
// result of hasPrefix, which is then unwrapped
if let hasPrefix = maybeString?.hasPrefix("f") {
    if hasPrefix {
        print(hasPrefix)
        print("maybeString starts with 'f'")
    }
}

// null coalesce
var anOptional: Int?
var coalesced = anOptional ?? 3 // anOptional is nil, coalesced to 3

//******************
// Optional Chaining as an Alternative to Forced Unwrapping
//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
////john.residence = Residence()
//
//// force unwrapping
////let roomCount = john.residence!.numberOfRooms
//// this triggers a runtime error
//
//// Optional chaining
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}

//******************
// Multi lvl optional chaining
//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var rooms = [Room]()
//    var numberOfRooms: Int {
//        return rooms.count
//    }
//    subscript(i: Int) -> Room {
//        get {
//            return rooms[i]
//        }
//        set {
//            rooms[i] = newValue
//        }
//    }
//    func printNumberOfRooms() {
//        print("The number of rooms is \(numberOfRooms)")
//    }
//    var address: Address?
//}
//
//class Room {
//    let name: String
//    init(name: String) { self.name = name }
//}
//
//class Address {
//    var buildingName: String?
//    var buildingNumber: String?
//    var street: String?
//    func buildingIdentifier() -> String? {
//        if buildingName != nil {
//            return buildingName
//        } else if buildingNumber != nil && street != nil {
//            return "\(buildingNumber) \(street)"
//        } else {
//            return nil
//        }
//    }
//}

//// Accessing Properties Through Optional Chaining
//let john = Person()
//
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}
//
//let someAddress = Address()
//someAddress.buildingNumber = "29"
//someAddress.street = "Acacia Road"
//john.residence?.address = someAddress
//
//// Calling Methods Through Optional Chaining
//if john.residence?.printNumberOfRooms() != nil {
//    print("It was possible to print the number of rooms.")
//} else {
//    print("It was not possible to print the number of rooms.")
//}
//
//if (john.residence?.address = someAddress) != nil {
//    print("It was possible to set the address.")
//} else {
//    print("It was not possible to set the address.")
//}
//
//// Accessing Subscripts Through Optional Chaining
////let johnsHouse = Residence()
////johnsHouse.rooms.append(Room(name: "Living Room"))
////johnsHouse.rooms.append(Room(name: "Kitchen"))
////john.residence = johnsHouse
//
//if let firstRoomName = john.residence?[0].name {
//    print("The first room name is \(firstRoomName).")
//} else {
//    print("Unable to retrieve the first room name.")
//}
//
//john.residence?[0] = Room(name: "Bathroom")
//
//// Linking Multiple Levels of Chaining
////let johnsAddress = Address()
////johnsAddress.buildingName = "The Larches"
////johnsAddress.street = "Laurel Street"
////john.residence?.address = johnsAddress
//
//if let johnsStreet = john.residence?.address?.street {
//    print("John's street name is \(johnsStreet).")
//} else {
//    print("Unable to retrieve the address.")
//}
//
//// Chaining on Methods with Optional Return Values
//if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
//    print("John's building identifier is \(buildingIdentifier).")
//}
//
//if let beginsWithThe =
//    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
//        if beginsWithThe {
//            print("John's building identifier begins with \"The\".")
//        } else {
//            print("John's building identifier does not begin with \"The\".")
//        }
//}
//
//// Accessing Subscripts of Optional Type
//var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
//testScores["Dave"]?[0] = 91
//testScores["Bev"]?[0]++
//testScores["Brian"]?[0] = 72
//// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
//print(testScores)


