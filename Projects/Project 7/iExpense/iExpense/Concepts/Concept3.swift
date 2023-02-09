//
//  Concept3.swift
//  iExpense
//
//  Created by Krish Murjani on 1/16/23.
//

import SwiftUI

private struct NewUser: Codable {
    var firstName: String
    var lastName: String
}

struct Concept3: View {
    @State private var user = NewUser(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        VStack(spacing: 20) {
            Text("User: \(user.firstName) \(user.lastName)")
                .font(.largeTitle)
            
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct Concept3_Previews: PreviewProvider {
    static var previews: some View {
        Concept3()
    }
}
