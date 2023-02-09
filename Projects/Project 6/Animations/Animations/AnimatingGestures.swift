//
//  AnimatingGestures.swift
//  Animations
//
//  Created by Krish Murjani on 1/3/23.
//

import SwiftUI

struct AnimatingGestures: View {
    @State private var dragAmount = CGSize.zero
    @State private var rotationAmount = 0.0
    @State private var enabled = false
    
    let letters = Array("Hello SwiftUI")
    
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
            
            Button {
                withAnimation(.easeOut.speed(0.3)) {
                    rotationAmount += 180
                }
            } label: {
                LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 15)
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged({
                                dragAmount = $0.translation
                            })
                            .onEnded({ _ in
                                withAnimation(.interpolatingSpring(stiffness: 100, damping: 5)) {
                                    dragAmount = .zero
                                }
                            })
                    )
            }.rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct AnimatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures()
    }
}
