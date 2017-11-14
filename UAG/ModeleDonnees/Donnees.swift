//
//  Donnees.swift
//  UAG
//
//  Created by etudiant1 on 11/14/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class Donnees {
    static func getData() -> [ModeleDonnees] {
        var data: [ModeleDonnees] = []
        
        let info = "This a test!"
        
        data.append(ModeleDonnees(name: "Ou faire du Sport?", info: "Au SUAPS", image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Comment s'inscrire?", info: "Il faut aller demander et remplir la fiche de renseignement.", image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Ou est le SUAPS?", info: "Va voir sur la carte.", image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Horaires de la salle de sport", info: "", image: #imageLiteral(resourceName: "CréneauxSalleMuscu") ))
        data.append(ModeleDonnees(name: "Question1", info: info, image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Question2", info: info, image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Question3", info: info, image: #imageLiteral(resourceName: "UA-Guid_logo")))
        data.append(ModeleDonnees(name: "Question4", info: info, image: #imageLiteral(resourceName: "UA-Guid_logo")))
        return data
    }
}
