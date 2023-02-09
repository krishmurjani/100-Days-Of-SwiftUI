//
//  AnimatingBindings.swift
//  Animations
//
//  Created by Krish Murjani on 1/2/23.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Stepper("Scale amount: \(Int(animationAmount))", value: $animationAmount.animation(), in: 1...10)
                .padding()
            
            Text("Scale amount: \(animationAmount)")
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindings()
    }
}
