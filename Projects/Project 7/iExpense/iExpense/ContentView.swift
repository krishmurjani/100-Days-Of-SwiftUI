//
//  ContentView.swift
//  iExpense
//  Created by Krish Murjani on 1/15/23.

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(types, id: \.self) { section in
                    Section(section) {
                        ForEach(expenses.items.filter({$0.type == section})) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(item.name)")
                                        .font(.headline)
                                    
                                    Text("\(item.type)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("\(item.amount, format: .currency(code: currencyCode))")
                                    .foregroundColor(highlight(for: item.amount))
                            }

                        }
                        .onDelete { indices in
                            for i in indices {
                                let filteredArray = expenses.items.filter({$0.type == section})
                                expenses.items.remove(at: expenses.items.firstIndex(of: filteredArray[i])!)
                            }
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
        
    }
    
    func highlight(for amount: Double) -> Color {
        switch amount {
        case ..<10.00:
            return .green
        case ..<100.00:
            return .blue
        default:
            return .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//    @State private var type = "Personal"

//            Picker("Type", selection: $type) {
//                ForEach(types, id: \.self) {
//                    Text($0)
//                }
//            }
//            .pickerStyle(.segmented)
