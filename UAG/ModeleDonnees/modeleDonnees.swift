//
//  modeleDonnees.swift
//  UAG
//
//  Created by etudiant1 on 11/14/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ModeleDonnees {
    var name = ""
    var info = ""
    var img: UIImage?
    
    init(name: String, info: String, image: UIImage?) {
        self.name = name
        self.info = info
        self.img = image
    }
}
