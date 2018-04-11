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
    let titles = [ "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9", "t10"]
    let diamonds = [ #imageLiteral(resourceName: "1.12.18Artboard 6"), #imageLiteral(resourceName: "1.12.18Artboard 10"), #imageLiteral(resourceName: "1.12.18Artboard 11"), #imageLiteral(resourceName: "1.12.18Artboard 7"), #imageLiteral(resourceName: "1.12.18Artboard 7") ]
    var button:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colors = [lightOrange, darkOrange, pink, purple, purple, purple, purple]
        // no lines in between cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // scroll to the selected info
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(scroll), userInfo: nil, repeats: false)
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
        
        cell.pictureForEvent.frame.origin.x = screenWidth / 4
        cell.pictureForEvent.frame.origin.y = screenHeight / 4
        
        cell.labelTitle.frame.origin.x = screenWidth / 3
        cell.labelTitle.center.y = cell.diamond.center.y
        
        cell.labelDescription.frame.origin.x = screenWidth / 3
        cell.labelDescription.frame.origin.y = 3/4 * screenHeight
        
        // make a fetch to get the image/year and set it
        
        let index = indexPath.row
        
        let viewCell:TimelineCellView = TimelineCellView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))
        viewCell.firstColor = self.colors[index / 2]
        viewCell.secondColor = self.colors[(index + 1) / 2]
        
        
        
        
        viewCell.backgroundColor = UIColor(red: 37/255, green: 22/255, blue: 51/255, alpha: 1.0)
        
        cell.backgroundView = viewCell
        cell.diamond.image = diamonds[index / 2]
        cell.labelYear.textColor = colors[index / 2]
        cell.labelYear.text = "20" + String(index + 18)
        
        cell.labelTitle.textColor = .white
        cell.labelDescription.textColor = .white
        cell.labelTitle.text = titles[index]
        cell.labelTitle.font = UIFont(name: "Helvetica", size: cell.labelTitle.font.pointSize)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

