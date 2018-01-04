//
//  ViewControllerAdmin.swift
//  UAG
//
//  Created by prof_dsi on 14/11/2017.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerAdmin: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    var modeJN: Bool = false
    
    //SEGUE POUR CARTE (zoomé sur Administration)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerCarte = segue.destination as! ViewControllerCarte
        ViewControllerCarte.BoutonMainAdmin = true
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
        }else if (data[dataID[indexPath.row]]?.contains("#scolaireToCarte"))! {
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
            background_Scolaire.image = #imageLiteral(resourceName: "interface_base")
        } else if modeJN == true {
            background_Scolaire.image = #imageLiteral(resourceName: "interface_base_nuit")
        }
        //crée un index avec les clés du dictionnaire dans le tableau vide
        //Pour ne pas a le faire manuellement, lors de l'initialisation
        showCarte.isHidden = true
        
        for cle in data.keys{
            dataID.append(cle)
        }
        dataID.sort() //pour trier les questions
        
        
        tableViewScolaire.dataSource = self //permet de gerer les sources de la tableView
        tableViewScolaire.delegate = self //permet de configurer le systeme de popup du tableView
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var background_Scolaire: UIImageView!
    @IBOutlet weak var tableViewScolaire: UITableView!
    
    //outlets de l'infoView (popup)
    
    @IBOutlet var infoView: UIView!
    @IBOutlet weak var infoViewImage: UIImageView!
    @IBOutlet weak var infoViewLabel: UILabel!
    @IBOutlet weak var infoViewLabelText: UILabel!
    
    
    @IBOutlet weak var showCarte: UIButton!
    @IBAction func btnShowCarte(_ sender: Any) {
        performSegue(withIdentifier: "scolaireToCarte", sender: sender)
    }
    
    
    
    // dictionnaire contenuant les informations, question : reponse
    private var data: [String:String] = ["Image": "UA-Guid_logo.png",
                                         "Bouton vers la carte": "#scolaireToCarte",
                                         
                                         "Comment régler ses droits d'inscription": "vous devez transmettre dans les 48h, les pièces justificatives attendues au format numérique à l’adresse suivante : www.univ-antilles.fr/pjweb (link is external).",
                                         "Suivre son inscription administrative": "Reponse",
                                         "Demander l'exonération des droits de scolarité": "Pour bénéficier de l’exonération des droits de scolarité, vous devez d’abord déposer au service de scolarité de votre composante (Unité de formation et de recherche, Département, Ecole, Institut) le dossier de demande d’exonération puis vous prenez contact avec une assistante sociale du CROUS.",
                                         
                                         "Demander l'annulation et le remboursement de son inscription": "L’annulation de l’inscription administrative peut être accordée si l’étudiant est accepté dans un autre établissement d’enseignement supérieur public en France, dans l’Union Européenne, l’Espace économique européenne et la Confédération Suisse, ou qu’il ne souhaite pas poursuivre son cursus et ne souhaite plus bénéficier du statut d’étudiant.",
                                         
                                         "Demander son transfert départ": "Demandez la délivrance d’un quitus au Service Commun de Documentation (bibliothèque universitaire). Cette démarche peut s’effectuer en ligne en cliquant sur le lien suivant : quitus@univ-ag.fr",
                                         
                                         "Comment payer par virement bancaire":"virement.png",
                                         "Question78": "Reponse"
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
