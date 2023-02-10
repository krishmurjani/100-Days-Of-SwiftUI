//
//  MissionView.swift
//  Moonshot
//
//  Created by Tanisha Murjani on 1/30/23.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        GeometryReader { geo in
        ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    Text("Launch Date: \(mission.formattedLaunchDate)")
//                        .font(.headline)
                        .font(.system(size: 20, weight: .light))
//                        .foregroundColor(.secondary)
                        .padding(.top, 5)
                        .padding(.bottom, -10)
                    
                    CustomDivider()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding([.bottom], 5)
                    }
                    .padding(.horizontal)
                    
                    CrewScrollView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewScrollView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(Capsule())
                        //                                        .clipShape(Circle())
                            .overlay {
                                Capsule()
                                //                                            Circle()
                                    .strokeBorder(.white, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            Text(crewMember.role)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}
