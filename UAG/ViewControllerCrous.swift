//
//  ViewControllerCrous.swift
//  UAG
//
//  Created by prof_dsi on 14/11/2017.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerCrous: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var modeJN: Bool = false
    //SEGUE POUR CARTE (zoomé sur Crous)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerCarte = segue.destination as! ViewControllerCarte
        ViewControllerCarte.BoutonMainCrous = true
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
            infoViewImage.image = UIImage(named: "\(data[dataID[indexPath.row]] ?? "UA-Guid_logo")")
            infoViewLabelText.text = ""
            showCarte.isHidden = true
        }else if (data[dataID[indexPath.row]]?.contains("#crousToCarte"))! {
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
        
        if modeJN == false {
            background_crous.image = #imageLiteral(resourceName: "interface_crous_bas")
        } else if modeJN == true {
            background_crous.image = #imageLiteral(resourceName: "interface_crous_bas_nuit")
        }
        
        //crée un index avec les clés du dictionnaire dans le tableau vide
        //Pour ne pas a le faire manuellement, lors de l'initialisation
        showCarte.isHidden = true
        
        for cle in data.keys{
            dataID.append(cle)
        }
        dataID.sort() //pour trier les questions
        
        
        tableViewCrous.dataSource = self //permet de gerer les sources de la tableView
        tableViewCrous.delegate = self //permet de configurer le systeme de popup du tableView
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var background_crous: UIImageView!
    @IBOutlet weak var tableViewCrous: UITableView!
    
    //outlets de l'infoView (popup)
    @IBOutlet var infoView: UIView!
    @IBOutlet weak var infoViewLabel: UILabel!
    @IBOutlet weak var infoViewLabelText: UILabel!
    @IBOutlet weak var infoViewImage: UIImageView!
    
    
    @IBOutlet weak var showCarte: UIButton!
    @IBAction func btnShowCarte(_ sender: Any) {
        performSegue(withIdentifier: "crousToCarte", sender: sender)
    }
    
    
    
    
    // dictionnaire contenuant les informations, question : reponse
    private var data: [String:String] = [
        "Image": "UA-Guid_logo.png",
        "Bouton vers la carte": "#crousToCarte",
        "Qu'est ce que le CROUS?": "Les centres régionaux des œuvres universitaires et scolaires ou CROUS sont des établissements publics à caractère administratif chargés principalement de l'aide sociale, de l'accueil des étudiants internationaux, du logement pour étudiants, de la restauration universitaire et de la vie culturelle étudiante. Ils sont animés, dans le cadre d'un réseau national, par le Centre national des œuvres universitaires et scolaires.",
        "Qui en sont les responsable?": "Le Conseil d’administration du CROUS des Antilles et de la Guyane est présidé par Monsieur Camille GALAP, Recteur de l’Académie de la Guadeloupe, Chancelier des l’Universités, membre de droit. La Vice-Présidence est assurée par Madame Charlina PILIER-REYES, étudiante  élue au Conseil d’Administration du 16 mars 2017.",
        "Qui est eligible à la bourse?": "Condition d’âge : moins de 28 ans, Condition de diplôme : Niveau Baccalauréat (pour la première demande), Condition de nationalité :étudiants français, ou andorrans de formation française étudiants européens        étudiants étrangers domiciliés en France depuis au moins 2 ans        étudiants étrangers réfugié ou apatride reconnus par l’OFPRA, Condition d’études :        formation initiale à temps plein        France ou Etat membre du Conseil de l’Europe        établissement d’enseignement public ou privé    formation habilité",
        "Vos bourses": "La demande de bourse et/ou de logement se fait uniquement en ligne, sur la plateforme messervices.etudiant.gouv.fr, Depuis l’année scolaire 2015-2016, les bourses sur critères sociaux émanant du Ministère de l’Agriculture, de l’Agroalimentaire et de la Forêt seront gérées par les Crous. Ainsi, les étudiants ayant droit à cette bourse bénéficieront d’un paiement mensuel.",
        "Votre contact": "Cité universitaire de SCHOELCHER, B.P. 7208, 97275 SCHOELCHER Cedex, Tél : 0596 61 36 73, Fax : 0596 61 91 50"
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
