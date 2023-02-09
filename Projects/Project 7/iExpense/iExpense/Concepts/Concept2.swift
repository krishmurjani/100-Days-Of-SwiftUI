//
//  Concept2.swift
//  iExpense
//
//  Created by Krish Murjani on 1/16/23.
//

import SwiftUI

struct Concept2: View {
    @State private var numbers = [Int]()
    @State private var number = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number") {
                    numbers.append(number)
                    number += 1
                }
                .buttonStyle(.borderedProminent)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct Concept2_Previews: PreviewProvider {
    static var previews: some View {
        Concept2()
    }
}
