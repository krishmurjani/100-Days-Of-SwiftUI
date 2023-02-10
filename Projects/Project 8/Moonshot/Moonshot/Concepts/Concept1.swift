//
//  Concept1.swift
//  Moonshot
//
//  Created by Krish Murjani on 1/22/23.
//

import SwiftUI

struct Concept1: View {
    var body: some View {
        GeometryReader { geo in
            Image("AppleParkChristmas")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct Concept1_Previews: PreviewProvider {
    static var previews: some View {
        Concept1()
    }
}
