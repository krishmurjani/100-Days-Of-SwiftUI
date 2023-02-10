/* Copy Class */

import Cocoa

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

let user = User()
print(user.copy().username)

let user1 = user
user1.username = "Taylor"

print(user.copy().username)
print(user.username)
print(user1.username)


/* Destructors */

class User1 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        
        print("\nUser \(id): I am alive :)")
    }
    
    deinit {
        print("User \(id): I am dead :(")
    }
}

for i in 1...3 {
    let user1 = User1(id: i)
    print("User \(user1.id): I am in control!")
}
