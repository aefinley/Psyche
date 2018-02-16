//
//  FactsTableViewController.swift
//  Psyche
//
//  Created by Allison Finley on 2/11/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class FactsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //tag0 = building
    //tag1 = journey
    //tag2 = asteroid
    
    
    
    var engineeringFactsList:EngineeringFactsData = EngineeringFactsData()
    //var asteroidFactsList:AsteroidFactsData = AsteroidFactsData()
    //var journeyFactsList:JourneyFactsData = JourneyFactsData()
    
    @IBOutlet weak var factsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factsTable.rowHeight = 100.0 //changes cell height
        self.factsTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if engineering button selected
        return engineeringFactsList.efacts.count
        //if asteroid button selected
        //return asteroidFactsList.afacts.count
        //if journey button selected
        //return journeyFactsList.jfacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell", for: indexPath) as! FactTableViewCell
        cell.layer.borderWidth = 0.0
        cell.factTitle.text = engineeringFactsList.efacts[indexPath.row].factName
        cell.factImage.image = engineeringFactsList.efacts[indexPath.row].factImage
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let x = sender as? UIButton {
            
        }
        else {
            let selectedIndex: IndexPath = self.factsTable.indexPath(for: sender as! UITableViewCell)!
            
            let fact = engineeringFactsList.efacts[selectedIndex.row]
            
            if(segue.identifier == "DetailViewSegue") {
                let viewController = segue.destination as! DetailViewController
                viewController.selectedFact = fact
            }
        }

    }

}
