import Cocoa

func getRandomNumber(from array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let number = getRandomNumber(from: nil)
let number2 = getRandomNumber(from: [])
let number3 = getRandomNumber(from: [1, 6, 7, 13, 69])

print("\(number)\n\(number2)\n\(number3)\n")
