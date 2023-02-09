//
//  ContentView.swift
//  Views And Modifiers
//
//  Created by Krish Murjani on 12/24/22.
//

import SwiftUI

struct MidnightsFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.custom("Helvetica Neue", size: 72))
            .kerning(-3)
            .foregroundStyle(LinearGradient(colors: [.blue, .blue.opacity(0.9), .cyan, .cyan.opacity(0.9)], startPoint: .leading, endPoint: .trailing))
            .contrast(1.0)
            .saturation(0.5)
            .tint(.green)
    }
}

extension View {
    func midnightsStyle() -> some View {
        modifier(MidnightsFont())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Midnights")
            Text("Taylor Swift")
        }
        .midnightsStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
