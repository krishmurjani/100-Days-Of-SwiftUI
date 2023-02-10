//
//  Concept4.swift
//  Moonshot
//
//  Created by Krish Murjani on 1/26/23.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
    var albums: Int
}

struct Address: Codable {
    var street: String
    var city: String
}

struct Concept4: View {
    @State var user: User
    
    var body: some View {
        VStack {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    },
                    "albums": 5
                }
                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode(User.self, from: data) {
                    user = decoded
                }
            }
            
            Text("Name: \(user.name)")
            Text("Address: \(user.address.street), \(user.address.city)")
            Text("Albums: \(user.albums)")
        }
    }
}

struct Concept4_Previews: PreviewProvider {
    static var previews: some View {
        Concept4(user: User(name: "TS", address: Address(street: "A", city: "B"), albums: 2))
    }
}
