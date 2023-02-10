import Cocoa

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("\(i): FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("\(i): Fizz")
    } else if i.isMultiple(of: 5) {
        print("\(i): Buzz")
    } else {
        print("\(i): -")
    }
}
