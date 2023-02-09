//
//  Concept1.swift
//  iExpense
//
//  Created by Krish Murjani on 1/16/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) private var dismiss
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}


private class User: ObservableObject {
   @Published var firstName = "Taylor"
   @Published var lastName = "Swift"
}


struct Concept1: View {
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Your name is \(user.firstName) \(user.lastName). ")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Krish")
            }
            
        }
        .padding()
    }
}

struct Concept1_Previews: PreviewProvider {
    static var previews: some View {
        Concept1()
    }
}
