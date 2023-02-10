import Cocoa

enum NumberErrors: Error {
    case outOfBounds
    case noRoot
}

func squareRoot(_ number: Int) -> (isPossible: Bool, root: Int) {
    for i in 1...number {
        if (i * i) == number {
            return (true, i)
        }
    }
    return (false, 0)
}

func squareRootOf(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw NumberErrors.outOfBounds
    }
    
    if squareRoot(number).isPossible {
        return squareRoot(number).root
    } else {
        throw NumberErrors.noRoot
    }
}

do {
    print("Sqaure root = \(try squareRootOf(944))")
} catch NumberErrors.noRoot {
    print("The number has no roots.")
} catch NumberErrors.outOfBounds {
    print("Please enter a number in the range 1 and 10,000")
} catch {
    print("Uh-oh! Error!")
}

