//
//  Battle.swift
//  batailleNavale
//
//  Created by Lilian on 07/06/2024.
//

import UIKit

class BattleViewController: UIViewController {
    var ships: [Ship] = []
    
    // Lien entre btn et code PS: je sais il y avait mieux
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
    
    // Collection pour stocker tous les boutons
    var buttons: [UIButton] = []
    var hitButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ajouter tous les boutons dans la collection
        buttons = [p1_1, p1_2, p1_3, p1_4, p1_5,
                   p2_1, p2_2, p2_3, p2_4, p2_5,
                   p3_1, p3_2, p3_3, p3_4, p3_5,
                   p4_1, p4_2, p4_3, p4_4, p4_5]
        
        // Définir les tags pour les btn
        for (index, button) in buttons.enumerated() {
            button.tag = index + 1 // Les tags commencent à 1
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // Identifiez quel bouton a été pressé en utilisant son tag
        let tag = sender.tag
        print("Button with tag \(tag) pressed")
        
        // Vérifiez si le bouton correspond à une position d'un bateau
        if isShipPosition(button: sender) {
            sender.backgroundColor = UIColor.red
            print("Button with tag \(tag) pressed [RED]")
        } else {
            sender.backgroundColor = UIColor.gray
            print("Button with tag \(tag) pressed [GRAY]")
        }
        
        // Désactivez le bouton après avoir été pressé
        sender.isEnabled = false
        
        // Ajoutez le bouton touché à la liste des boutons touchés
        hitButtons.append(sender)
        
        // Vérifiez si toutes les positions des bateaux ont été touchées
        checkWinCondition()
    }
    
    // Vérifiez si le bouton correspond à une position d'un bateau
    func isShipPosition(button: UIButton) -> Bool {
        for ship in ships {
            for positionButton in ship.positions {
                if positionButton.tag == button.tag {
                    return true
                }
            }
        }
        return false
    }
    
    // Vérifiez si toutes les positions des bateaux ont été touchées
    func checkWinCondition() {
        for ship in ships {
            var shipHitCount = 0
            for positionButton in ship.positions {
                if hitButtons.contains(where: { $0.tag == positionButton.tag }) {
                    shipHitCount += 1
                }
            }
            if shipHitCount == ship.positions.count {
                print("win")
                disableRemainingButtons()
                var nextViewController = self.storyboard?.instantiateViewController(identifier: "WinSegue") as! BattleHardViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }
    
    // Méthode appelée avant de passer à la prochaine vue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WinSegue" {
            // Configurez le contrôleur de vue de destination si nécessaire
        }
    }
    
    // Fonction pour désactiver les boutons restants
    func disableRemainingButtons() {
        for button in buttons {
            if button.isEnabled {
                button.isEnabled = false
                button.backgroundColor = UIColor.black
            }
        }
    }
}
