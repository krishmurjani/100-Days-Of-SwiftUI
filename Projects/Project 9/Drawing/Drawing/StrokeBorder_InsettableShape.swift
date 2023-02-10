
//  StrokeBorder_InsettableShape.swift
//  Drawing
//
//  Created by Krish Murjani on 2/8/23.
//

import SwiftUI

struct StrokeBorder_InsettableShape: View {
//    @State private var degrees = 0
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .strokeBorder(.blue, lineWidth: 40)
                
                // made Arc conform to InsettableShape by adding the inset() function in Shapes file
                Arc(startAngle: .degrees(0), endAngle: .degrees(358), clockwise: true)
                    .inset(by: 10)
                    .strokeBorder(.red, lineWidth: 40)
//                    .animation(.easeInOut, value: degrees)
            }
            .padding()
            
//            Button("Progess!") {
//                withAnimation(.easeInOut) {
//                    degrees += 20
//                }
//            }
//            .buttonStyle(.borderedProminent)
            
        }
    }
}

struct StrokeBorder_InsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorder_InsettableShape()
    }
}
