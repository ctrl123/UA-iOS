//
//  ViewController.swift
//  UAG
//
//  Created by etudiant1 on 10/20/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var interface_acceuil: UIImageView!
    @IBOutlet weak var jour_nuit: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button_scolaire(_ sender: UIButton) {
    }
    
    @IBAction func button_sport(_ sender: UIButton) {
    }
    
    @IBAction func button_carte(_ sender: UIButton) {
    }
    
    @IBAction func button_crous (sender: UIButton) {
    }
    
    @IBAction func change_fond(_ sender: Any) {
        if jour_nuit.selectedSegmentIndex == 1 {
            interface_acceuil.image = #imageLiteral(resourceName: "launch_screen")
        }
        else {
            interface_acceuil.image = #imageLiteral(resourceName: "interface_base")
        }
    }
    
}

