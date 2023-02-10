import Cocoa

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1
    
//    init(model: String, numberOfSeats: Int) {
//        self.model = model
//        self.numberOfSeats = numberOfSeats
//    }
    
    mutating func changeGear(value: Int) -> Bool {
        if value > 0 && value < 7 {
            currentGear = value
            return true
        }
        return false
    }
}

var toyota = Car(model: "Fortuner", numberOfSeats: 6)
print(toyota.currentGear)
toyota.changeGear(value: 4)
print(toyota.currentGear)
toyota.changeGear(value: 0)
print(toyota.currentGear)
toyota.changeGear(value: 7)
print(toyota.currentGear)
