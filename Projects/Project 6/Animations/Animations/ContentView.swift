//
//  ContentView.swift
//  Animations
//
//  Created by Krish Murjani on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap me") {
//                animationAmount += 0.5
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                                .easeOut(duration: 1)
                                    .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
            }
            .onAppear {
                animationAmount = 2
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
