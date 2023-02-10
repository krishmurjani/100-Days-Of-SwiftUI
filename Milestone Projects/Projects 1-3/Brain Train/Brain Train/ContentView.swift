//
//  ContentView.swift
//  Brain Train
//
//  Created by Krish Murjani on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    let moves = [ "👊", "🖐️", "✌️"]
    let movesInWords = ["Rock", "Paper", "Scissors"]
    @State private var randomMove = Int.random(in: 0...2)
    
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var isChoiceSame = false
    @State private var isGameOver = false
    @State private var questions = 0
    
    var body: some View {
        ZStack {
            AngularGradient(colors: [.indigo, .blue, .teal, .mint, .indigo], center: .center)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Brain Train")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
                
                VStack(spacing: 60) {
                    VStack(spacing: 30) {
                        HStack(spacing: -4) {
                            Text("My move: ")
                                .font(.largeTitle)
                            Text("\(moves[randomMove])")
                                .font(.system(size: 48))
                        }
                        
                        VStack {
                            Text("You need to")
                                .font(.title)
                            
                            Text(shouldWin ? "Win" : "Lose")
                                .bold()
                                .font(.largeTitle)
                        }
                    }
                    
                    HStack(spacing: 30) {
                        ForEach(0..<moves.count, id: \.self) { move in
                            Button {
                                buttonTapped(move)
                                
                                
                            } label: {
                                VStack {
                                    Text(moves[move])
                                        .font(.system(size: 90))
                                    Text(movesInWords[move])
                                        .bold()
                                }
                                .foregroundStyle(.thinMaterial)
                            }
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("Score: \(score)")
                            .bold()
                            .font(.title2)
                        
                        Text("Questions: \(questions)")
                            .bold()
                            .font(.headline)
                    }
                    
                }
                .alert("Uh-oh!", isPresented: $isChoiceSame) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("We both played the same move! Pick something different.")
                }
                .alert("Game Over!", isPresented: $isGameOver) {
                    Button("Restart", action: restartGame)
                } message: {
                    Text("Well Played! Your final score is \(score).")
                }
            }
        }
    }
    
    func buttonTapped(_ move: Int) {
        questions += 1
        evaluateScore(move)
        shouldWin.toggle()
        randomizeMove()
        
        if questions == 10 {
            isGameOver = true
        }
        
        //haptic feedback
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
    }
    
    func restartGame() {
        questions = 0
        score = 0
        shouldWin.toggle()
        randomizeMove()
    }
    
    func randomizeMove() {
        let range1 = [0, 1]
        let range2 = [1, 2]
        let range3 = [0, 2]
        
        switch randomMove {
        case 0:
            randomMove = range2.randomElement() ?? 1
        case 1:
            randomMove = range3.randomElement() ?? 2
        case 2:
            randomMove = range1.randomElement() ?? 0
        default:
            randomMove = Int.random(in: 0...2)
        }
    }
    
    func evaluateScore(_ move: Int) {
        let appChoice = moves[randomMove]
        let userChoice = moves[move]
        
        if shouldWin {
            switch appChoice {
            case "👊":
                switch userChoice {
                case "🖐️":
                    score += 1
                case "✌️":
                    score -= 1
                default:
                    score = score
                    isChoiceSame = true
                }
            case "🖐️":
                switch userChoice {
                case "✌️":
                    score += 1
                case "👊":
                    score -= 1
                default:
                    score = score
                    isChoiceSame = true
                }
                
            case "✌️":
                switch userChoice {
                case "👊":
                    score += 1
                case "🖐️":
                    score -= 1
                default:
                    score = score
                    isChoiceSame = true
                }
            default:
                score = score
            }
        } else {
            switch appChoice {
            case "👊":
                switch userChoice {
                case "🖐️":
                    score -= 1
                case "✌️":
                    score += 1
                default:
                    score = score
                    isChoiceSame = true
                }
            case "🖐️":
                switch userChoice {
                case "✌️":
                    score -= 1
                case "👊":
                    score += 1
                default:
                    score = score
                    isChoiceSame = true
                }
                
            case "✌️":
                switch userChoice {
                case "👊":
                    score -= 1
                case "🖐️":
                    score += 1
                default:
                    score = score
                    isChoiceSame = true
                }
            default:
                score = score
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
