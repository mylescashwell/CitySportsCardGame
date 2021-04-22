//
//  TeamCardCollectionVC.swift
//  CitySportsCardGame
//
//  Created by Myles Cashwell on 4/22/21.
//

import UIKit

class TeamCardCollectionVC: UICollectionViewController {
    
    //MARK: - Properties
    var displayedTeams: [Team] = []
    var targetedTeam: Team?
    var selectedCity = "Philly"
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleTeams(city: selectedCity)
    }
    
    
    //MARK: - Functions
    func shuffleTeams(city: String) {
        if city == "Philly" {
            let shuffledPhillyTeams = TeamController.philly.shuffled()
            let phillyTeams = shuffledPhillyTeams.prefix(3)
            displayedTeams = Array(phillyTeams)
            targetedTeam = TeamController.newYork.randomElement()
        } else {
            let shuffledNYTeams = TeamController.newYork.shuffled()
            let nyTeams = shuffledNYTeams.prefix(3)
            displayedTeams = Array(nyTeams)
            targetedTeam = TeamController.philly.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let team = targetedTeam else { return }
        displayedTeams.append(team)
        displayedTeams.shuffle()
        self.title = "Find \(team.teamName)"
        collectionView.reloadData()
    }
    
    func presentAlert(team: Team) {
        let success = team == targetedTeam
        let alertController = UIAlertController(title: success ? "Great!" : "Oops! Try again...", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleTeams(city: self.selectedCity)
        }
        
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    
    //MARK: - UICollectionViewDatasource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedTeams.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as? TeamCollectionViewCell else { return UICollectionViewCell() }
    
        let team = displayedTeams[indexPath.row]
        cell.team = team
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = displayedTeams[indexPath.row]
        presentAlert(team: team)
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitySwitchingVC" {
            guard let destination = segue.destination as? CitySwitchingVC else { return }
            destination.delegate = self
        }
    }
}


//MARK: - Extensions
extension TeamCardCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}

extension TeamCardCollectionVC: CitySwitchingVCDelegate {
    func citySelected(city: String) {
        selectedCity = city
        shuffleTeams(city: city)
    }
}
