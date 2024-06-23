//
//  Battle.swift
//  batailleNavale
//
//  Created by Lilian on 21/06/2024.
//

import UIKit

class BattleHardViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Masquer le bouton "Back"
        self.navigationItem.hidesBackButton = true
        
    }
    
    // Action pour le bouton "Restart"
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        // Retourner à l'écran de démarrage
        navigationController?.popToRootViewController(animated: true)
    }
}
