//
//  Transitions.swift
//  Animations
//
//  Created by Krish Murjani on 1/3/23.
//

import SwiftUI

struct Transitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
                    .zIndex(-3)
            }
        }
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
