//
//  TimelineTableController.swift
//  Psyche
//
//  Created by Jennifer on 3/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class TimelineTableController: UITableViewController {
    
    let lightOrange = UIColor(red: 251/255, green: 158/255, blue: 1/255, alpha: 1.0)
    let darkOrange = UIColor(red: 245/255, green: 113/255, blue: 51/255, alpha: 1.0)
    let pink = UIColor(red: 239/255, green: 89/255, blue: 101/255, alpha: 1.0)
    let purple = UIColor(red: 167/255, green: 62/255, blue: 92/255, alpha: 1.0)
    
    var colors:[UIColor] = [UIColor]()
    var button:Int!
    var eventsList = [Fact]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colors = [lightOrange, darkOrange, pink, purple, purple, purple, purple]
        // no lines in between cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        if eventsList.isEmpty {
            query()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // scroll to the selected info
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(scroll), userInfo: nil, repeats: false)
    }
    
    @objc func scroll() {
        self.tableView.reloadData()
        let indexPath = IndexPath(row: button, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! TimelineCell
        let screenHeight = self.tableView.bounds.height
        let screenWidth = self.tableView.bounds.width
        
        // moving things around
        cell.diamond.frame.origin.x = screenWidth / 5 - cell.diamond.frame.width / 2
        cell.diamond.frame.origin.y = screenHeight / 8
        
        cell.labelYear.frame.origin.x = screenWidth / 20
        cell.labelYear.frame.origin.y = screenHeight / 9
        cell.labelYear.isHidden = true
        
        cell.pictureForEvent.frame.origin.x = screenWidth / 3
        cell.pictureForEvent.frame.origin.y = screenHeight / 4
        
        cell.labelTitle.frame.origin.x = screenWidth / 3
        cell.labelTitle.center.y = cell.diamond.center.y
        
        cell.labelDescription.frame.origin.x = screenWidth / 3
        cell.labelDescription.frame.origin.y = 1/2 * screenHeight
        //cell.labelDescription.isHidden = false
        
        let index = indexPath.row
        
        let viewCell:TimelineCellView = TimelineCellView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))
        viewCell.firstColor = self.colors[index / 2]
        viewCell.secondColor = self.colors[(index + 1) / 2]
        
        viewCell.backgroundColor = UIColor(red: 37/255, green: 22/255, blue: 51/255, alpha: 1.0)
        
        cell.backgroundView = viewCell
        
        var indexMission:Int = 0
        
        for i in 0..<eventsList.count {
            
            if index == eventsList[i].timelineEvent {
                indexMission = i
            }
        }
        
        cell.diamond.image = UIImage(data: eventsList[indexMission].timelineImage! as Data)
        cell.pictureForEvent.image = UIImage(data: eventsList[indexMission].image! as Data)
        
        cell.labelYear.textColor = colors[index / 2]
        
        cell.labelTitle.textColor = .white
        cell.labelDescription.textColor = .white
        
        cell.labelTitle.text = eventsList[indexMission].date
        
        cell.labelDescription.text = eventsList[indexMission].title
        
        cell.labelDescription.font = UIFont(name: "Helvetica", size: cell.labelTitle.font.pointSize)
        
        cell.labelTitle.font = UIFont(name: "Helvetica", size: cell.labelTitle.font.pointSize)
        cell.labelTitle.sizeToFit()
        
        return cell
    }
    
    func query() {
        // get a handler to the contact entity
        let entityDescription = NSEntityDescription.entity(forEntityName: "Fact", in: managedObjectContext)
        
        // create a fetch request
        let request: NSFetchRequest<Fact> = Fact.fetchRequest()
        
        // associate the request with contact handler
        request.entity = entityDescription
        
        // build the search request predicate (query)
        let pred = NSPredicate(format: "(date != nil)")
        request.predicate = pred
        
        // perform the query and process the query results
        do {
            eventsList = try managedObjectContext.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as! [Fact]
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}

