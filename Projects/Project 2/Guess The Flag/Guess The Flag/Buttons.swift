//
//  Buttons.swift
//  Guess The Flag
//
//  Created by Krish Murjani on 12/21/22.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button("Button 5") { }
                .buttonStyle(.borderless)
            Button("Button 6", role: .destructive) { }
                .buttonStyle(.borderless)
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
