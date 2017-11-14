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
    var BoutonMainCrous = Bool()
    var BoutonMainSport = Bool()
    var BoutonMainAdmin = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let UALocation = CLLocationCoordinate2DMake(14.620, -61.094)
        let CrousLocation = CLLocationCoordinate2DMake(14.620742, -61.092579)
        let SportLocation = CLLocationCoordinate2DMake(14.620797, -61.093532)
        let AdminLocation = CLLocationCoordinate2DMake(14.619831, -61.094798)
        
        let UAspan = MKCoordinateSpanMake(0.0015, 0.0015)
        let Servicespan = MKCoordinateSpanMake(0.0009, 0.0009)
        let UAregion = MKCoordinateRegion(center: UALocation, span: UAspan)
        let CrousRegion = MKCoordinateRegion(center: SportLocation, span: Servicespan)
        let SportRegion = MKCoordinateRegion(center: SportLocation, span: Servicespan)
        let AdminRegion = MKCoordinateRegion(center: AdminLocation, span: Servicespan)

        Carte.setRegion(UAregion, animated: true)
        if BoutonMainCrous == true {
            Carte.setRegion(CrousRegion, animated: true)
        }
        if BoutonMainSport == true {
            Carte.setRegion(SportRegion, animated: true)
        }
        if BoutonMainAdmin == true {
            Carte.setRegion(AdminRegion, animated: true)
        }
        
        let UAPin = MKPointAnnotation()
        let CrousPin = MKPointAnnotation()
        let SportPin = MKPointAnnotation()
        let AdminPin = MKPointAnnotation()
        
        UAPin.coordinate = UALocation
        CrousPin.coordinate = CrousLocation
        SportPin.coordinate = SportLocation
        AdminPin.coordinate = AdminLocation
        
        UAPin.title = "UA"
        UAPin.subtitle = "Université des Antilles"
        
        Carte.addAnnotation(UAPin)
        
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
