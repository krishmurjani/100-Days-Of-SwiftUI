//
//  ContentView.swift
//  BetterRest
//
//  Created by Krish Murjani on 12/29/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    var sleepTime: Date {
        calculateBedtime()
    }
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    HStack {
                        Text("Desired wake up time")
                        Spacer()
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(1..<21) { cup in
                            Text((cup == 1 ? "\(cup) cup" : "\(cup) cups"))
                        }
                    }
//                    Stepper((coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups"), value: $coffeeAmount, in: 1...20)
                    
//                    Text("Coffee cups: \(coffeeAmount)")
                }
                
                Section(header: Text("Recommended Sleep Time")) {
                    HStack {
                        Spacer()
                        Text("\(sleepTime.formatted(date: .omitted, time: .shortened))")
                            .bold()
                        .font(.largeTitle)
                        Spacer()
                    }
                }
            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("\(alertMessage)")
            }
        }
    }
    
    func calculateBedtime () -> Date {
        var calculatedSleepTime = Date.now
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let wake = Double(hours + minutes)
            let coffee = Double(coffeeAmount + 1) // +1 is done because of the Picker, remove it for Stepper
             
            let prediction = try model.prediction(wake: wake, estimatedSleep: sleepAmount, coffee: coffee)
            calculatedSleepTime = wakeUp - prediction.actualSleep
            
//            alertTitle = "Your ideal sleep time is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            showAlert = true
            alertTitle = "Error!"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        return calculatedSleepTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
