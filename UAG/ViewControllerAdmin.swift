//
//  ViewControllerAdmin.swift
//  UAG
//
//  Created by prof_dsi on 14/11/2017.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerAdmin: UIViewController {
    
    
    @IBOutlet weak var background_scolaire: UIImageView!
    var modeJN: Bool = false
    //SEGUE POUR CARTE (zoomé sur Administration)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerCarte = segue.destination as! ViewControllerCarte
        ViewControllerCarte.BoutonMainAdmin = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if modeJN == true{
            background_scolaire.image = #imageLiteral(resourceName: "launch_screen")
        } else {
            background_scolaire.image = #imageLiteral(resourceName: "interface_base")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
