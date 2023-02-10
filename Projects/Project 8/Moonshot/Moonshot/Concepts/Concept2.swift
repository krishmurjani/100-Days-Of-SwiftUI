//
//  Concept2.swift
//  Moonshot
//
//  Created by Krish Murjani on 1/22/23.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        // Created a custom text to print this every time a Text is loaded.
        print("Creating a new custom text!")
        self.text = text
    }
}

struct Concept2: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    // Lazy stacks load only those views that are seen on the screen. It loads the further views as they're shown.
                    CustomText("Item \($0 + 1)")
                        .font(.largeTitle)
                }
            }
//            .frame(maxWidth: .infinity)
        }
    }
}

struct Concept2_Previews: PreviewProvider {
    static var previews: some View {
        Concept2()
    }
}
