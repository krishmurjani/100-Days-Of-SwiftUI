//
//  AnimationStack.swift
//  Animations
//
//  Created by Krish Murjani on 1/3/23.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .animation(.default, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 50 : 0))
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: enabled)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
