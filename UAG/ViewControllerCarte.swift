//
//  ViewControllerCarte.swift
//  UAG
//
//  Created by ARGIRE Jonathan on 10/29/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerCarte: UIViewController {

    @IBOutlet weak var Carte: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let UAlocation = CLLocationCoordinate2DMake(14.620, -61.094)
        let Crouslocation = CLLocationCoordinate2DMake(14.620742, -61.092579)
        let Sportlocation = CLLocationCoordinate2DMake(14.620797, -61.093532)
        let AdminLocation = CLLocationCoordinate2DMake(14.619831, -61.094798)
        
        let UAspan = MKCoordinateSpanMake(0.002, 0.002)
        let UAregion = MKCoordinateRegion(center: UAlocation, span: UAspan)
        Carte.setRegion(UAregion, animated: true)
        
        let UAPin = MKPointAnnotation()
        let CrousPin = MKPointAnnotation()
        let SportPin = MKPointAnnotation()
        let AdminPin = MKPointAnnotation()
        
        UAPin.coordinate = UAlocation
        CrousPin.coordinate = Crouslocation
        SportPin.coordinate = Sportlocation
        AdminPin.coordinate = AdminLocation
        
        UAPin.title = "UA"
        UAPin.subtitle = "Université des Antilles"
        CrousPin.title = "CROUS / CLOUS"
        CrousPin.subtitle = "Logement & Bourse"
        SportPin.title = "Sports"
        SportPin.subtitle = "Gymnase & Terrain"
        AdminPin.title = "Administration UA"
        AdminPin.subtitle = "Administration générale & SUAPS"
        
        Carte.addAnnotation(UAPin)
        Carte.addAnnotation(CrousPin)
        Carte.addAnnotation(SportPin)
        Carte.addAnnotation(AdminPin)
        
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
