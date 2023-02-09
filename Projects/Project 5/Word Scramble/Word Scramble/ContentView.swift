//
//  ContentView.swift
//  Word Scramble
//
//  Created by Krish Murjani on 12/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    @State private var showRestartAlert = false
    @State private var score = 0
    @State private var showScoreInfo = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text("\(word)")
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .alert("Do you want to restart?", isPresented: $showRestartAlert) {
                Button("No", role: .cancel) { }
                Button("Yes", action: startGame)
            } message: {
                Text("Restarting will give you a new word and result in loss of the current data.")
            }
            .alert("Score System", isPresented: $showScoreInfo) {
                Button("Dismiss", role: .cancel) { }
            } message: {
                Text("3 letter word: 1 point\n4 letter word: 2 points\n5 letter word: 3 points\n6 letter word: 4 points\n7 letter word: 5 points\n8 letter word: 8 points\n\n**Bonus Points**\n3 words: 5 points\n5 words: 10 points\n10 words: 20 points\n15 words: 30 points\n20 words: 40 points")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Restart") {
                        showRestartAlert = true
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Text("Score: \(score)")
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showScoreInfo = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
    }
        
        func startGame() {
            usedWords = [String]()
            newWord = ""
            score = 0
            
            if let startURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
                if let words = try? String(contentsOf: startURL) {
                    let allWords = words.components(separatedBy: .newlines)
                    rootWord = allWords.randomElement() ?? "evermore"
                    return
                }
            }
            fatalError("Couldn't load start.txt from bundle.")
        }
        
        func addNewWord() {
            let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            
            guard answer.count > 0 else { return }
            
            guard validateWord(answer) else { return }
            
            withAnimation {
                usedWords.insert(answer, at: 0)
                calculateScore(answer)
            }
            newWord = ""
        }
        
        func validateWord(_ answer: String) -> Bool {
            guard isOriginal(answer) else {
                wordError(title: "Word used already!", message: "Be more original.")
                return false
            }
            
            guard isPossible(answer) else {
                wordError(title: "Word not possible!", message: "You can't spell that word from '\(rootWord)'!")
                return false
            }
            
            guard isReal(answer) else {
                wordError(title: "Word not recognized!", message: "You can't just make them up, you know!")
                return false
            }
            
            guard isShort(answer) else {
                wordError(title: "Word too short!", message: "Your word should be 3 letters long or more.")
                return false
            }
            
            guard isSameAsRoot(answer) else {
                wordError(title: "Word same as root word!", message: "You can't use the same word.")
                return false
            }
            
            return true
        }
        
        func calculateScore(_ word: String) {
            switch word.count {
            case 3:
                score += 1
            case 4:
                score += 2
            case 5:
                score += 3
            case 6:
                score += 4
            case 7:
                score += 5
            case 8:
                score += 8
            default:
                score = score
            }
            
            switch usedWords.count {
            case 3:
                score += 5
            case 5:
                score += 10
            case 10:
                score += 20
            case 15:
                score += 30
            case 20:
                score += 40
            default:
                score = score
            }
        }
        
        func isOriginal(_ word: String) -> Bool {
            !usedWords.contains(word)
        }
        
        func isPossible(_ word: String) -> Bool {
            var copy = rootWord
            
            for letter in word {
                if let index = copy.firstIndex(of: letter) {
                    copy.remove(at: index)
                } else {
                    return false
                }
            }
            return true
        }
        
        func isReal(_ word: String) -> Bool {
            let checker = UITextChecker()
            
            let range = NSRange(location: 0, length: word.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            
            return misspelledRange.location == NSNotFound
        }
        
        func isShort(_ word: String) -> Bool {
            !(word.count < 3)
        }
        
        func isSameAsRoot(_ word: String) -> Bool {
            !(word == rootWord)
        }
        
        func wordError(title: String, message: String) {
            errorTitle = title
            errorMessage = message
            showAlert = true
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
