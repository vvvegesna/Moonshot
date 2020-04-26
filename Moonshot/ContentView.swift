//
//  ContentView.swift
//  Moonshot
//
//  Created by Vegesna, Vijay V EX1 on 4/18/20.
//  Copyright © 2020 Vegesna, Vijay V EX1. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showCrew = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.showCrew ? mission.crewNames : mission.formattedLaunchDate)
                    }
                }
                
            }
        .navigationBarTitle("Moonshot")
        .navigationBarItems(trailing: Button("Switch") {
                self.showCrew.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
