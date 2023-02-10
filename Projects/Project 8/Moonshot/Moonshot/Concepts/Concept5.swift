//
//  Concept5.swift
//  Moonshot
//
//  Created by Krish Murjani on 1/26/23.
//

import SwiftUI

struct Concept5: View {
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct Concept5_Previews: PreviewProvider {
    static var previews: some View {
        Concept5()
    }
}
