//
//  ARPickerController.swift
//  Psyche
//
//  Created by Petra Novakovic on 2/21/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
class ARPickerController: UIViewController {
    
    
    @IBOutlet weak var ARLabel: UILabel!
    
    @IBOutlet weak var menu: UIImageView!
    
     var menuShowing = false //boolean to see if menu is showing currently or not
    
    @IBOutlet weak var asteroidBtn: UIButton!
    
    @IBOutlet weak var satelliteBtn: UIButton!
    
    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var menuButton: UIButton!
    
    
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
    
   @IBAction func unwindToARPickerController(segue:UIStoryboardSegue) { }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ARViewController {
        
        
            if (segue.identifier == "viewAsteroid"){
            
                destination.sentValue = 0
            }
            else if(segue.identifier == "viewSatellite"){
                destination.sentValue = 1
            }
        }
        
    }
    
    
    @IBAction func goToTimeline(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Timeline") as! TimelineBackgroundControllerViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func goHome(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func goToExplore(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Explore") as! MissionFactsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func goToGallery(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mediaGallery") as! MediaGallery
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //close menu if user clicks on main view
        
        ARLabel.textColor = UIColor.white;
        asteroidBtn.layer.cornerRadius = 8
        satelliteBtn.layer.cornerRadius = 8
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
        
        menuButton.addTarget(self, action: #selector(ViewController.openMenuAction(_:)), for: UIControlEvents.touchUpInside)
        
        //gesture created so if user clicks on outside view menu will close
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.closeMenu))
        
        self.view.addGestureRecognizer(gesture)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        
        menuWidth.constant = -300 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImage")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if(menuShowing){
            menuWidth.constant = -300
        }

   
    }



    
}

