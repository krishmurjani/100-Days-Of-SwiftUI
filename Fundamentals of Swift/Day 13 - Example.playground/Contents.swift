import Cocoa

protocol Vehicle {
    var name: String  { get }
    var currentPassengers: Int { get }
    
    func estimateTime(distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    
    var name: String = "Car"
    
    var currentPassengers: Int {
        return 4+3
    }
    
    func estimateTime(distance: Int) -> Int {
        20
    }
    
    func travel(distance: Int) {
        // bye
    }
}
