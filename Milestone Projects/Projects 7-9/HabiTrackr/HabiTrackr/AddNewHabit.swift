//
//  AddNewHabit.swift
//  HabiTrackr
//
//  Created by Krish Murjani on 3/5/23.
//

import SwiftUI

struct AddNewHabit: View {
    @Environment (\.dismiss) var dismiss
    
    @State private var habitTitle = ""
    @State private var habitDescription = ""
    
    @ObservedObject var habits: Habits
    
    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    TextField("Title", text: $habitTitle)
                }
                Section("Description") {
                    TextField("Description", text: $habitDescription)
                }
            }
            .navigationTitle("Add New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Add") {
                    habits.items.append(Habit(title: habitTitle, description: habitDescription))
                    
                    dismiss()
                }
                .disabled(habitTitle.isEmpty)
            }
        }
    }
}

struct AddNewHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabit(habits: Habits())
    }
}
