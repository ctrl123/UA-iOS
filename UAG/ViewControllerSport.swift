//
//  ViewControllerSport.swift
//  UAG
//
//  Created by etudiant1 on 10/20/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerSport: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //SEGUE POUR CARTE (zoomé sur Hall des sports)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerCarte = segue.destination as! ViewControllerCarte
        ViewControllerCarte.BoutonMainSport = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //fonction qui ajoute les données dans chaque cellule
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        //indexPath.row renvoie le numero de la cellule
        let text = dataID[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    
    //fonction qui gère la popup de chaque élément de la tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let data = dataID[indexPath.row]
        
        /*
         En fonction de la question, la réponse peut etre differente, et affichera soit une image, soit un bouton vers la carte, ou du texte de réponse et masquera les autres éléments de la popup
         */
        if (data[dataID[indexPath.row]]?.contains(".png"))!
            || (data[dataID[indexPath.row]]?.contains("jpg"))! {
            infoViewImage.image = UIImage(named: "\(data[dataID[indexPath.row]] ?? "UA-Guid-logo")")
            infoViewLabelText.text = ""
            showCarte.isHidden = true
        }else if (data[dataID[indexPath.row]]?.contains("#sportToCarte"))! {
            infoViewLabelText.text = ""
            infoViewImage.image = nil
            showCarte.isHidden = false
        }else{
            infoViewLabelText.text = data[dataID[indexPath.row]]
            infoViewImage.image = nil
            showCarte.isHidden = true
        }
        
        //affiche la question de la popup
        infoViewLabel.text = dataID[indexPath.row]
        //Corrige le centre du subView
        infoView.center = view.center
        //Ajoute le subView au superView (ViewControllerSport)
        view.addSubview(infoView)
    }
 
    @IBAction func closeInfoView(_ sender: Any) {
        //Bouton X, supprime la subView du viewControllerSport
        infoView.removeFromSuperview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //crée un index avec les clés du dictionnaire dans le tableau vide
        //Pour ne pas a le faire manuellement, lors de l'initialisation
        showCarte.isHidden = true
        
        for cle in data.keys{
            dataID.append(cle)
        }
        dataID.sort() //pour trier les questions
 
        
        tableViewSport.dataSource = self //permet de gerer les sources de la tableView
        tableViewSport.delegate = self //permet de configurer le systeme de popup du tableView
        
        
        
        // Do any additional setup after loading the view.
    } 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var background_sport: UIImageView!
    
    @IBOutlet weak var tableViewSport: UITableView!
    
    //outlets de l'infoView (popup)
    @IBOutlet var infoView: UIView!
    @IBOutlet weak var infoViewLabel: UILabel!
    @IBOutlet weak var infoViewLabelText: UILabel!
    
    @IBOutlet weak var infoViewImage: UIImageView!
    
    @IBOutlet weak var showCarte: UIButton!
    @IBAction func btnShowCarte(_ sender: Any) {
        performSegue(withIdentifier: "sportToCarte", sender: sender)
    }
    
    
    // dictionnaire contenuant les informations, question : reponse
    private var data: [String:String] = [
        "Ou faire du sport?": "Au SUAPS",
        "Comment s'inscrire?": "Il faut aller récuperer et remplir la fiche de renseignement du SUAPS.",
        "Ou est le Hall des sports?": "#sportToCarte",
        "Horaires de la salle de musculation": "CréneauxSalleMuscu.png",
        "Question1": "Reponse",
        "Question2": "Reponse",
        "Question3": "Reponse",
        "Question4": "Reponse",
        "Question5": "Reponse",
        "Question6": "Reponse",
        "Question7": "Reponse"
    ]
    
    // Tableau de String vide
    private var dataID = [String]()
 
    //indique le nombre de section dans la tableView, il y en a qu'1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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

