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
        
        let location = CLLocationCoordinate2DMake(14.620, -61.094)
        let span = MKCoordinateSpanMake(0.004, 0.004)
        let region = MKCoordinateRegion(center: location, span: span)
        Carte.setRegion(region, animated: true)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = "UA"
        dropPin.subtitle = "Université des Antilles"
        Carte.addAnnotation(dropPin)
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
