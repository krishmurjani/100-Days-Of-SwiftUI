//
//  AstronautView.swift
//  Moonshot
//
//  Created by Tanisha Murjani on 2/2/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let astronaut = astronauts["armstrong"]!
    
    static var previews: some View {
        AstronautView(astronaut: astronaut)
            .preferredColorScheme(.dark)
    }
}
