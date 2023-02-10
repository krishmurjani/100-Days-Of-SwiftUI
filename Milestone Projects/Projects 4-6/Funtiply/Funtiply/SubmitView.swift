
import SwiftUI

struct SubmitView: View {
    var answers: [Int]
    
    var body: some View {
        NavigationView {
            HStack {
                ForEach(answers, id: \.self) {
                    Text("\($0)")
                }
            }
            .navigationTitle("Answers")
        }
    }
}

struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView(answers: [2, 4, 6])
    }
}
