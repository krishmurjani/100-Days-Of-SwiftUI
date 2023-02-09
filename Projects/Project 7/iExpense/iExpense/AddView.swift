//
//  AddView.swift
//  iExpense
//
//  Created by Krish Murjani on 1/20/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var isFocused: Bool // add next and done button
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @FocusState private var isAmountFocused: Bool
    
    @ObservedObject var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                        .focused($isFocused)
                }
                
                Section("Amount") {
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isAmountFocused)
                }
                
                Section("Type") {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)

                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        
                        dismiss()
                    }
                    .disabled(name.isEmpty ? true : false)
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Next") {
                        isFocused = false
                        isAmountFocused = true
                    }
                }
            }
            .onAppear {
                isFocused = true
//                isAmountFocused = true
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
