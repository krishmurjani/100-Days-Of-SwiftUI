import Cocoa

protocol Building {
    var numberOfRooms: Int { get set }
    var cost: Int { get set }
    var name: String { get }
     
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("There are \(numberOfRooms) rooms.\nThe cost is $\(cost).\n")
    }
}

struct House: Building {
    var numberOfRooms: Int
    var cost: Int
    var name: String

//    func printSalesSummary() {
//        print("This house is sold by \(name).\nThere are \(numberOfRooms) rooms.\nThe cost is $\(cost).\n")
//    }
}

struct Office: Building {
    var numberOfRooms: Int
    var cost: Int
    var name: String
    
    func printSalesSummary() {
        print("This office is sold by \(name).\nThere are \(numberOfRooms) rooms.\nThe cost is $\(cost).")
    }
}

let house = House(numberOfRooms: 5, cost: 50000, name: "Lakes and Company")
house.printSalesSummary()

let office = Office(numberOfRooms: 10, cost: 100000, name: "Imperial Realtors")
office.printSalesSummary()
