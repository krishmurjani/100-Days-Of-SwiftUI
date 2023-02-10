//
//  Concept3.swift
//  Moonshot
//
//  Created by Krish Murjani on 1/26/23.
//

import SwiftUI

struct Concept3: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                NavigationLink {
                    Text("Detail row \(item)")
                } label: {
                    Text("Row \(item)")
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}

struct Concept3_Previews: PreviewProvider {
    static var previews: some View {
        Concept3()
    }
}
