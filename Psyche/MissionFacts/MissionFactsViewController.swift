//
//  MissionFactsViewController.swift
//  Psyche
//
//  Created by Allison Finley on 1/18/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
//import CoreData

class MissionFactsViewController: UIViewController {
    
    @IBOutlet weak var engineeringFactsButton: UIButton!
    @IBOutlet weak var journeyFactsButton: UIButton!
    @IBOutlet weak var asteroidFactsButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var menu: UIImageView!
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        if(menuShowing){
            menuWidth.constant = -300
        }
    }
    
    @IBAction func openNasa(_ sender: Any) {
        if let url = URL(string: "http://nasa.gov/psyche"){
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
        }
    }
    
    @IBAction func openASU(_ sender: Any) {
        if let url = URL(string: "http://psyche.asu.edu"){
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
        }
    }
    
    @IBAction func openMenuAction(_ sender: UIButton) {
        sender.shake()
        if(menuShowing){
            menuWidth.constant = -300
        }
        else{
            menuWidth.constant = -5
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        menuShowing = !menuShowing
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        if(menuShowing){
            menuWidth.constant = -300
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
            menuShowing = false
        }
    }
    
    @IBAction func goToTimeline(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Timeline") as! TimelineBackgroundControllerViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
   
    @IBAction func goToAR(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "3DPicker") as! ARPickerController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func goToGallery(_ sender: Any) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mediaGallery") as! MediaGallery
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        //TODO
        self.view.backgroundColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)
        super.viewDidLoad()
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        
        self.view.bringSubview(toFront: menu)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MissionFactsViewController.closeMenu))
        
        self.view.addGestureRecognizer(gesture)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
   
 


    menuWidth.constant = -300 //menu should be hidden when view loads, width is 300 so needs to be -300
    
    menu.layer.shadowOpacity = 1
    menu.layer.shadowRadius = 5
    menu.image = #imageLiteral(resourceName: "menuImage")
    //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
    
    
    self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
    self.view.bringSubview(toFront: menu)

    }
    
    override func didReceiveMemoryWarning() {
       //TODO
        
        super.didReceiveMemoryWarning()
        
    }
    
    //prepare func to send tag# to factsTableViewCrontroller
    
    
    @IBAction func transition(_ sender: Any) {
        performSegue(withIdentifier: "goToCategory", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCategory" {
            let dest = segue.destination as! FactsTableViewController
            let send = sender as! UIButton
            dest.buttonSelected = send.tag
        }
    }
    
    @IBAction func unwindFromFactsTable(segue: UIStoryboardSegue) {
        
    }
    
}
