//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Krish Murjani on 1/2/23.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 50, damping: 1).speed(5).repeatCount(3, autoreverses: true)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
