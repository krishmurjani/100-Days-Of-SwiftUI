

import SwiftUI

struct ContentView: View {
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    
    @State private var questions = 0
    @State private var isGameOver = false
    
    @State private var flagTap = -1
    @State private var opacity = 1.0
    
    @State private var animationAmount = 0.0
    @State private var scaleAmount = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess The Flag!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of: ")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                    }
                    
                    VStack(spacing: 50) {
                        ForEach(0..<3) { number in
                            Button {
                                animationAmount += 360
                                flagTapped(number)
                            } label: {
                                FlagImage(country: countries[number])
                                    .rotation3DEffect(
                                        flagTap == number ? .degrees(animationAmount) : .degrees(0),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                                    .animation(.default, value: animationAmount)
                                
                                    .opacity(flagTap == number ? 1 : opacity)
                                    .animation(nil, value: opacity)
                                
                                    .scaleEffect(flagTap == number ? 1 : scaleAmount)
                                    .animation(.interpolatingSpring(stiffness: 50, damping: 10), value: scaleAmount)
                            }
                        }
                    }
                    .alert(scoreTitle, isPresented: $showingScore) {
                        Button("Dismiss", action: askQuestion)
                    } message: {
                        Text(scoreMessage)
                    }
                    .alert(scoreTitle, isPresented: $isGameOver) {
                        Button("Restart", action: restartGame)
                        //                        Button("OK") {
                        //                            isGameOver = true
                        //                        }
                    } message: {
                        Text(scoreMessage)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            .padding()
        }
    }
    
    func flagTapped(_ number: Int) {
        opacity = 0.25
        scaleAmount = 0.75
        flagTap = number
        questions += 1
        showingScore = true
        scoreMessage = ""
        
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct!"
            
        } else {
            score -= 1
            scoreTitle = "Wrong!"
            scoreMessage = "That's the flag for \(countries[number]).\n\(countries[correctAnswer]) is flag \(correctAnswer + 1).\n"
            
        }
        
        if questions == 8 {
            showingScore = false
            isGameOver = true
            scoreTitle += "\nGame Over!"
        }
        
        scoreMessage += "Your score is \(score)."
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagTap = -1
        opacity = 1
        scaleAmount = 1
    }
    
    func restartGame() {
        questions = 0
        score = 0
        askQuestion()
    }
}

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
