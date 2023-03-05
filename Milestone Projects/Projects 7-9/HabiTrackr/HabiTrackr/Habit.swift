//
//  Habit.swift
//  HabiTrackr
//
//  Created by Krish Murjani on 3/5/23.
//

import Foundation

struct Habit: Codable {
    var title: String
    var description: String
}

class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            
            let encoded = try? encoder.encode(self.items)
            UserDefaults.standard.set(encoded, forKey: "Habits")
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        
        if let savedItems = UserDefaults.standard.data(forKey: "Habits")  {
            if let decoded = try? decoder.decode([Habit].self, from: savedItems) {
                items = decoded
                return
            }
        }
        
        items =  []
    }
}
