//
//  ContentView.swift
//  Funtiply
//
//  Created by Krish Murjani on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var difficulty = 1
    @State private var numberOfQuestions = 5
    @State private var isGameActive = false
    
    @State private var multipliers: [Int] = []
    @State private var answers: [Int] = []
    @State private var answer = ""
    
    let questionOptions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            VStack(spacing: -40) {
                Form {
                    Stepper("Tables up to... \(difficulty)", value: $difficulty, in: 2...12)
                        .onChange(of: difficulty) { newValue in
                            isGameActive = false
                            multipliers = []
                            answers = []
                    }
                    
                    Section {
                        Text("How many questions would you like?")
                            .bold()
                            .font(.subheadline)
                        
                        Picker("How many questions would you like?", selection: $numberOfQuestions) {
                            ForEach(questionOptions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .listRowSeparator(.hidden)
                    
                    Button("Generate!") {
                        isGameActive = true
                        generateQuestions()
                        generateAnswers()
                    }.disabled(isGameActive)
                    
//                    Button("Clear") {
//                        isGameActive = false
//                        multipliers = []
//                        answers = []
//                    }
                }
//                if isGameActive {
//
//                    VStack(spacing: -1) {
//                        Text("Gameplay")
//                            .bold()
//                            .font(.largeTitle)
//
//                        Form {
//                            VStack(alignment: .leading) {
//                                HStack(alignment: .center, spacing: 0) {
//                                    VStack(alignment: .leading) {
//                                        ForEach(multipliers, id: \.self) {
//                                            Text("\(difficulty) x \($0)")
//                                        }
//                                    }
//
//                                    VStack(alignment: .leading) {
//                                        ForEach(0..<answers.count) { _ in
//                                            //
//                                        }
//                                    }
//                                }
//                                .font(.title)
//                            }
//                        }
//                    }
//                }
                
            }
            .navigationTitle("Funtiply")
            .sheet(isPresented: $isGameActive) {
                GameView(numberOne: Array(repeating: difficulty, count: numberOfQuestions), numberTwo: multipliers, numberOfQuestions: numberOfQuestions)
            }
        }
    }
    
    func generateQuestions() {
        var random = -1
        
        for _ in 1...numberOfQuestions {
            random = Int.random(in: 1...12)
            
            if !multipliers.contains(random) {
                multipliers.append(random)
            } else {
                multipliers.append(Int.random(in: 1...12))
            }
            
        }
    }
    
    func generateAnswers() {
        for i in multipliers {
            answers.append(i * difficulty)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
