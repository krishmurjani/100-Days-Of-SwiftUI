//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Krish Murjani on 1/20/23.
//

import SwiftUI

struct ExpenseItem: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
