//
//  ContentView.swift
//  HabiTrackr
//
//  Created by Krish Murjani on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items, id: \.title) { habit in
                    NavigationLink {
                        Text(habit.title)
                    } label: {
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(habit.title)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                    
                                    Text(habit.description)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("\(Int.random(in: 0...9))")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("HabiTrackr")
            .sheet(isPresented: $isShowingAddView) {
                AddNewHabit(habits: habits)
            }
        }
    }
    
    func removeItems(at offset: IndexSet)  {
        habits.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
