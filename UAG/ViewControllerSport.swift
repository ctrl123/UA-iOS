//
//  ViewControllerSport.swift
//  UAG
//
//  Created by etudiant1 on 10/20/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerSport: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! //1.
        
        let text = dataID[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell //4.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: dataID[indexPath.row], message: "\(data[dataID[indexPath.row]] ?? "reponse").", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Compris.", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        for i in 0...15 {
            //data.append("zth","\(i)")
        }*//*
        for (cle, valeur) in data{
         
        }*/
        
        tableViewSport.dataSource = self
        tableViewSport.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var background_sport: UIImageView!
    
    @IBOutlet weak var tableViewSport: UITableView!
    
    private var dataID: [String] = ["Ou faire du sport?","Ou s'inscrire","Ou est le SUAPS?"]
    
    private var data: [String:String] = ["Ou faire du sport?": "Au SUAPS", "Ou s'inscrire": "Toujours au SUAPS", "Ou est le SUAPS?": "Va zyeuter la carte"]
    
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

