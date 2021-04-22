//
//  CitySwitchingVC.swift
//  CitySportsCardGame
//
//  Created by Myles Cashwell on 4/22/21.
//

import UIKit

protocol CitySwitchingVCDelegate: AnyObject {
    func citySelected(city: String)
}

class CitySwitchingVC: UIViewController {
    
    //MARK: - Properties
    weak var delegate: CitySwitchingVCDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func phillyButtonTapped(_ sender: Any) {
        delegate?.citySelected(city: "Philly")
        self.dismiss(animated: true)
    }
    
    @IBAction func nyButtonTapped(_ sender: Any) {
        delegate?.citySelected(city: "NY")
        self.dismiss(animated: true)
    }
}
