//
//  Team.swift
//  CitySportsCardGame
//
//  Created by Myles Cashwell on 4/22/21.
//

import UIKit

class Team {
    let teamName: String
    let teamCity: String
    let teamLogo: UIImage?
    let uuid: String
    
    init(teamName: String, teamCity: String, teamLogo: UIImage?, uuid: String = UUID().uuidString) {
        self.teamName = teamName
        self.teamCity = teamCity
        self.teamLogo = teamLogo
        self.uuid = uuid
    }
}

//MARK: - Extensions
extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
