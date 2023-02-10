import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    func speak() {
        print("Bark! Bark! Bark!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow! Meow! Meow!")
    }
}

class Corgi: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    override func speak() {
        print("BARK! BARK! BARK!")
    }
}

class Poodle: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    override func speak() {
        print("bark! bark!")
    }
}

class Persian: Cat {
    override init(isTame: Bool, legs: Int) {
        super.init(isTame: isTame, legs: legs)
    }
    
    override func speak() {
        print("meow! meow! meow!")
    }
}

class Lion: Cat {
    override init(isTame: Bool, legs: Int) {
        super.init(isTame: isTame, legs: legs)
    }
    
    override func speak() {
        print("MEOW! MEOW! MEOW!")
    }
}

let lion = Lion(isTame: false, legs: 4)
lion.speak()

let persian = Persian(isTame: true, legs: 4)
persian.speak()

let corgi = Corgi(legs: 4)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let cat = Cat(isTame: true, legs: 4)
cat.speak()

let dog = Dog(legs: 4)
dog.speak()
