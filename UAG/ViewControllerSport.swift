//
//  ViewControllerSport.swift
//  UAG
//
//  Created by etudiant1 on 10/20/17.
//  Copyright © 2017 etudiant1. All rights reserved.
//

import UIKit

class ViewControllerSport: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! //1.
        
        let text = data[indexPath.row] //2.
        
        cell.textLabel?.text = text //3.
        
        return cell //4.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...15 {
            data.append("\(i)")
        }
        
        tableViewSport.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var background_sport: UIImageView!
    
    @IBOutlet weak var tableViewSport: UITableView!
    
    private var data: [String] = []
    
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

