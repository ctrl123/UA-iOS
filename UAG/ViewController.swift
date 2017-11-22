//
//  ViewController.swift
//  UAG
//
//  Created by etudiant1 on 10/20/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    // booleen permettant de savoir le mode de l'interface (jour ou nuit)
    var modeJN: Bool = false
    
    // tout les IBOutlet besoins
    @IBOutlet weak var indication: UILabel!
    @IBOutlet weak var interface_acceuil: UIImageView!
    @IBOutlet weak var jour_nuit: UISegmentedControl!
    
    @IBOutlet weak var bouton_Sp_fonc: UIButton!
    @IBOutlet weak var bouton_S_fonc: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialisation de l'interface en mode jour
        if modeJN == true {
            modeJN = false
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Fonction des boutons pour Changer de page
    @IBAction func button_scolaire(_ sender: UIButton) {
        performSegue(withIdentifier: "goto_scolaire", sender: sender)
    }
    
    @IBAction func button_sport(_ sender: UIButton) {
        performSegue(withIdentifier: "goto_sport", sender: sender)
    }
    
    @IBAction func button_carte(_ sender: UIButton) {
        performSegue(withIdentifier: "goto_carte", sender: sender)
    }
    
    @IBAction func bouton_crous(_ sender: UIButton) {
        performSegue(withIdentifier: "goto_crous", sender: sender)
    }
    
    
    /* Fontion du bouton jour nuit
     change l'interface
     */
    @IBAction func change_fond(_ sender: Any) {
        if jour_nuit.selectedSegmentIndex == 1 {
            interface_acceuil.image = #imageLiteral(resourceName: "launch_screen")
            modeJN = true
            indication.textColor = UIColor.white
        }
        else {
            interface_acceuil.image = #imageLiteral(resourceName: "interface_base")
            modeJN = false
        }
    }
    //Envoie linformation que l'inrerface est changé a chaque ViewControlelr
   override func prepare(for segue : UIStoryboardSegue, sender: Any?){
    if segue.identifier == "goto_scolaire" {
        let ViewControllerScolaire = segue.destination as! ViewControllerAdmin
         ViewControllerScolaire.modeJN = modeJN
        
    } else if segue.identifier == "goto_sport" {
        let ViewControllerSport = segue.destination as! ViewControllerSport
        ViewControllerSport.modeJN = modeJN
        
    } else if segue.identifier == "goto_crous" {
        let ViewControllerCrous = segue.destination as! ViewControllerCrous
        ViewControllerCrous.modeJN = modeJN
        
    }
    }
    
    
}

