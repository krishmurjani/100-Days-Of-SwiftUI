//
//  ContentView.swift
//  WeSplit
//
//  Created by Krish Murjani on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 5
    @FocusState private var amountIsFocused: Bool
    
//    let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    let currencyCode = FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount / 100) * tipSelection
        let totalAmount = checkAmount + tipValue
        
        return totalAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Amount")) {
                    TextField("Enter amount: ", value: $checkAmount, format: currencyCode)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                }
                
                Section(header: Text("Number of People")) {
                    Picker("Pick number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
//                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Total")) {
                    HStack {
                        Text("Check Amount")
                        
                        Spacer()
                        
                        Text(checkAmount, format: currencyCode)
                    }
                    
                    HStack {
                        Text("Grand Total")
                        
                        Spacer()
                        
                        Text(grandTotal, format: currencyCode)
                    }
                    
                    HStack {
                        Text("Total per person")
                        
                        Spacer()
                        
                        Text(totalPerPerson, format: currencyCode)
                            .foregroundColor((tipPercentage == 0 ? .red : .primary))
                    }
                    .bold()
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
