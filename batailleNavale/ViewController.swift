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
    }


}

