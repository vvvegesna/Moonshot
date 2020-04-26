//
//  Mission.swift
//  Moonshot
//
//  Created by Vegesna, Vijay V EX1 on 4/18/20.
//  Copyright © 2020 Vegesna, Vijay V EX1. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var image: String {
        "apollo\(id)"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var crewNames: String {
        let members = crew.map { $0.name }
        return members.joined(separator: ",")
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
