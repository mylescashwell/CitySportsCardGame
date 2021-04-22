//
//  TeamController.swift
//  CitySportsCardGame
//
//  Created by Myles Cashwell on 4/22/21.
//

import UIKit

class TeamController {
    static let philly = [Team(teamName: "Eagles", teamCity: "Philly", teamLogo: UIImage(named: "eaglesLogo")),
                         Team(teamName: "Phillies", teamCity: "Philly", teamLogo: UIImage(named: "philliesLogo")),
                         Team(teamName: "76ers", teamCity: "Philly", teamLogo: UIImage(named: "sixersLogo")),
                         Team(teamName: "Flyers", teamCity: "Philly", teamLogo: UIImage(named: "flyersLogo"))]
    
    static let newYork = [Team(teamName: "Yankees", teamCity: "NY", teamLogo: UIImage(named: "nyYankees")),
                          Team(teamName: "Giants", teamCity: "NY", teamLogo: UIImage(named: "nyGiants")),
                          Team(teamName: "Nets", teamCity: "NY", teamLogo: UIImage(named: "brooklynNets")),
                          Team(teamName: "Rangers", teamCity: "NY", teamLogo: UIImage(named: "nyRangers"))]
}
