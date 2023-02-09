//
//  Midnights.swift
//  Guess The Flag
//
//  Created by Krish Murjani on 12/21/22.
//

import SwiftUI

struct Midnights: View {
    var body: some View {
        VStack {
            VStack(spacing: -33) {
                Text("Tay**l**or Swift")
                    .fontWeight(.heavy)
                    .font(.custom("Helvetica Neue", size: 68))
                    .kerning(-3)
                    .offset(x: -84)
                
                Text("Midnights")
                    .bold()
                    .font(.custom("Helvetica Neue", size: 72))
                    .kerning(-3)
            }
            .foregroundStyle(LinearGradient(colors: [.blue, .blue.opacity(0.9), .cyan, .cyan.opacity(0.9)], startPoint: .leading, endPoint: .trailing))
            .contrast(1.0)
            .saturation(0.5)
            .tint(.green)
            
            VStack(spacing: -30) {
                Text("Midnights")
                    .font(.custom("Helvetica Neue", size: 65))
                    .fontWeight(.heavy)
                    .kerning(-3)
                Text("Mayhem")
                    .font(.custom("Helvetica Neue", size: 72))
                    .fontWeight(.heavy)
                    .kerning(-2)
                Rectangle()
                    .size(width: 109, height: 8.8)
                    .offset(x: 232, y: 18.6)
                Rectangle()
                    .size(width: 121, height: 7.8)
                    .offset(x: 232, y: -20)
            }
        }
    }
}

struct Midnights_Previews: PreviewProvider {
    static var previews: some View {
        Midnights()
    }
}
