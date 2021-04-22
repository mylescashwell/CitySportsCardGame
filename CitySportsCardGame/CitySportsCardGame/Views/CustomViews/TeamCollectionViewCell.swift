//
//  TeamCollectionViewCell.swift
//  CitySportsCardGame
//
//  Created by Myles Cashwell on 4/22/21.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    
    
    //MARK: - Properties
    var team: Team? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let team = team else { return }
        teamImageView.contentMode = .scaleAspectFill
        teamImageView.image = team.teamLogo
    }
}
