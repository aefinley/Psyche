//
//  FactsTableViewController.swift
//  Psyche
//
//  Created by Allison Finley on 2/11/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
import CoreData

class FactsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var buttonSelected:Int?
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var category = ""
    var factsList = [Fact]()
    //let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func query() {
        category = getCategory(categoryType: buttonSelected!)
        
        // get a handler to the contact entity
        let entityDescription = NSEntityDescription.entity(forEntityName: "Fact", in: managedObjectContext)
            
        // create a fetch request
        let request: NSFetchRequest<Fact> = Fact.fetchRequest() as! NSFetchRequest<Fact>
            
        // associate the request with contact handler
        request.entity = entityDescription
            
        // build the search request predicate (query)
        let pred = NSPredicate(format: "(categoryType = %@)", category)
        request.predicate = pred
            
        // perform the query and process the query results
        do {
            /*var results*/factsList = try managedObjectContext.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as! [Fact]
                /*
            if results.count > 0 {
                let match = results[0] as! NSManagedObject
                    
                category = match.value(forKey: "categoryType") as! String
            }*/
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func getCategory(categoryType:Int) -> String {
        if(categoryType == 0) { //tag0 = Engineering
            titleLabel.text = "ENGINEERING FACTS"
            image.image = #imageLiteral(resourceName: "Building")
            return "Engineering"
        } else if(categoryType == 1) { //tag1 = Journey
            titleLabel.text = "JOURNEY FACTS"
            image.image = #imageLiteral(resourceName: "Journey")
            return "Journey"
        } else { //tag2 = Asteroid
            titleLabel.text = "ASTEROID FACTS"
            image.image = #imageLiteral(resourceName: "Asteroid")
            return "Asteroid"
        }
    }
    
    @IBOutlet weak var factsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.factsTable.separatorStyle = UITableViewCellSeparatorStyle.none //take out lines between cells
        
        if factsList.isEmpty {
            query()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell", for: indexPath) as! FactTableViewCell
        cell.layer.borderWidth = 0.0
        cell.factTitle.text = factsList[indexPath.row].title
        cell.factImage.image = UIImage(data: factsList[indexPath.row].image)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let x = sender as? UIButton {}
        else {
            let selectedIndex: IndexPath = self.factsTable.indexPath(for: sender as! UITableViewCell)!
            let fact = factsList[selectedIndex.row]
            if(segue.identifier == "DetailViewSegue") {
                let viewController = segue.destination as! DetailViewController
                viewController.selectedFact = fact
            }
        }

    }
    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        
    }

}
