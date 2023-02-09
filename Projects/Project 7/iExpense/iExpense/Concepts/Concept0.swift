//
//  Concept0.swift
//  iExpense
//
//  Created by Krish Murjani on 1/20/23.
//

import SwiftUI

struct Concept0: View {
    //    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
        @AppStorage("tapCount") private var tapCount = 0
        
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
    //                UserDefaults.standard.set(tapCount, forKey: "Tap")
                }
            }
            .padding()
        }
    }

struct Concept0_Previews: PreviewProvider {
    static var previews: some View {
        Concept0()
    }
}
