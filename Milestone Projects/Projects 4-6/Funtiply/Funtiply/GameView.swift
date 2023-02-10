
import SwiftUI

struct GameView: View {
    var numberOne: [Int]
    var numberTwo: [Int]
    var numberOfQuestions: Int
    
    @State private var answers = Array(repeating: "", count: 20)
    @State private var didSubmit = false
    @State private var checked = Array(repeating: 0, count: 20)
    @State private var answerRed = Array(repeating: false, count: 20)
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(0..<numberOfQuestions) { index in
                    Section {
                        Text("\(index + 1)) \(numberOne[index]) x \(numberTwo[index])")
                            .bold()
                        
                        TextField("Answer", text: $answers[index])
                            .keyboardType(.numberPad)
                            .foregroundColor(answerRed[index] ? .red : .primary)
                    }
                    .fontDesign(.rounded)
                    .font(.title2)
                }
                
                Button("Submit") {
                    calculateAnswers()
                }
            }
            .navigationTitle("\(numberOfQuestions) Questions")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $didSubmit) {
                SubmitView(answers: checked)
            }
        }
    }
    
    func calculateAnswers() {
        for i in 0..<numberOfQuestions {
            if !(Int(answers[i]) == (numberOne[i] * numberTwo[i])) {
                checked[i] = numberOne[i] * numberTwo[i]
                answerRed[i] = true
            } else {
                answerRed[i] = false
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(numberOne: [2, 3, 4], numberTwo: [4, 5, 6], numberOfQuestions: 3)
    }
}
