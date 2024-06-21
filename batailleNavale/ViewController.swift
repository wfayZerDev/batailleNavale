//
//  ViewController.swift
//  batailleNavale
//
//  Created by Lilian on 07/06/2024.
//

import UIKit

struct Ship {
    var positions: [UIButton]
}

class ViewController: UIViewController {
    
    // Lien entre btn et code
    @IBOutlet weak var p1_1: UIButton!
    @IBOutlet weak var p1_2: UIButton!
    @IBOutlet weak var p1_3: UIButton!
    @IBOutlet weak var p1_4: UIButton!
    @IBOutlet weak var p1_5: UIButton!
    @IBOutlet weak var p2_1: UIButton!
    @IBOutlet weak var p2_2: UIButton!
    @IBOutlet weak var p2_3: UIButton!
    @IBOutlet weak var p2_4: UIButton!
    @IBOutlet weak var p2_5: UIButton!
    @IBOutlet weak var p3_1: UIButton!
    @IBOutlet weak var p3_2: UIButton!
    @IBOutlet weak var p3_3: UIButton!
    @IBOutlet weak var p3_4: UIButton!
    @IBOutlet weak var p3_5: UIButton!
    @IBOutlet weak var p4_1: UIButton!
    @IBOutlet weak var p4_2: UIButton!
    @IBOutlet weak var p4_3: UIButton!
    @IBOutlet weak var p4_4: UIButton!
    @IBOutlet weak var p4_5: UIButton!
    
    @IBOutlet weak var nextPageButton: UIButton!
    
    // Collection pour stocker tous les boutons
    var buttons: [UIButton] = []
    var disabledButtons: [UIButton] = []
    var ships: [Ship] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ajouter tous les boutons dans la collection
        buttons = [p1_1, p1_2, p1_3, p1_4, p1_5,
                   p2_1, p2_2, p2_3, p2_4, p2_5,
                   p3_1, p3_2, p3_3, p3_4, p3_5,
                   p4_1, p4_2, p4_3, p4_4, p4_5]
        
        // Définir les tags
        for (index, button) in buttons.enumerated() {
            button.tag = index + 1 // Les tags commencent à 1
        }
        
        // Désactiver le bouton de la page suivante au chargement initial
        nextPageButton.isEnabled = false
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // Identifiez quel bouton a été pressé en utilisant son tag
        let tag = sender.tag
        print("Button with tag \(tag) pressed")
        
        // Vérifiez si le bouton peut être désactivé
        if disabledButtons.count < 3 && canBeDisabled(button: sender) {
            // Désactiver le bouton pressé
            sender.isEnabled = false
            disabledButtons.append(sender)
            
            // Vérifier si trois boutons ont été désactivés
            if disabledButtons.count == 3 {
                // Activer le bouton pour passer à la page suivante
                nextPageButton.isEnabled = true
                
                // Enregistrer les boutons désactivés comme un bateau
                let ship = Ship(positions: disabledButtons)
                ships.append(ship)
            }
        } else {
            print("Cannot disable this button or maximum of 3 buttons already disabled")
        }
    }
    
    // Vérifiez si le bouton peut être désactivé en s'assurant qu'il est adjacent aux autres désactivés
    func canBeDisabled(button: UIButton) -> Bool {
        if disabledButtons.isEmpty {
            return true
        }
        
        for disabledButton in disabledButtons {
            if areAdjacent(button1: button, button2: disabledButton) {
                return true
            }
        }
        
        return false
    }
    
    // Vérifiez si deux boutons sont adjacents
    func areAdjacent(button1: UIButton, button2: UIButton) -> Bool {
        let index1 = buttons.firstIndex(of: button1)!
        let index2 = buttons.firstIndex(of: button2)!
        
        let row1 = index1 / 5
        let col1 = index1 % 5
        let row2 = index2 / 5
        let col2 = index2 % 5
        
        let rowDiff = abs(row1 - row2)
        let colDiff = abs(col1 - col2)
        
        return (rowDiff == 1 && colDiff == 0) || (rowDiff == 0 && colDiff == 1)
    }
    
    @IBAction func go(_ sender: Any) {
        // Appeler le segue pour charger l'écran suivant
        performSegue(withIdentifier: "Play", sender: self)
    }
    
    // Méthode appelée avant de passer à la prochaine vue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Vérifiez si le segue est celui que vous attendez
        if segue.identifier == "Play" {
            // Accédez au contrôleur de vue de destination
            if let nextViewController = segue.destination as? BattleViewController {
                // Passez les données des bateaux désactivés à la prochaine vue
                nextViewController.ships = ships
            }
        }
    }
}
