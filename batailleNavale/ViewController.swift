//
//  ViewController.swift
//  batailleNavale
//
//  Created by Lilian on 07/06/2024.
//

import UIKit

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
    
    
    // Collection pour stocker tous les boutons
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Ajouter tous les boutons dans la collection
        buttons = [p1_1, p1_2, p1_3, p1_4, p1_5,
                   p2_1, p2_2, p2_3, p2_4, p2_5,
                   p3_1, p3_2, p3_3, p3_4, p3_5,
                   p4_1, p4_2, p4_3, p4_4, p4_5]
    
        // Définir les tags
        for (index, button) in buttons.enumerated() {
            button.tag = index + 1 // Les tags commencent à 1
        }

        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
            // Identifiez quel bouton a été pressé en utilisant son tag
            let tag = sender.tag
            print("Button with tag \(tag) pressed")
            
            // Vous pouvez utiliser le tag pour effectuer des actions spécifiques
            switch tag {
            case 1:
                print("p1_1 action")
            case 2:
                print("p1_2 action")
            case 3:
                print("p1_3 action")
            case 4:
                print("p1_4 action")
            case 5:
                print("p1_5 action")
            case 6:
                print("p2_1 action")
            case 7:
                print("p2_2 action")
            case 8:
                print("p2_3 action")
            case 9:
                print("p2_4 action")
            case 10:
                print("p2_5 action")
            case 11:
                print("p3_1 action")
            case 12:
                print("p3_2 action")
            case 13:
                print("p3_3 action")
            case 14:
                print("p3_4 action")
            case 15:
                print("p3_5 action")
            case 16:
                print("p4_1 action")
            case 17:
                print("p4_2 action")
            case 18:
                print("p4_3 action")
            case 19:
                print("p4_4 action")
            case 20:
                print("p4_5 action")
            default:
                break
            }
        }
}

