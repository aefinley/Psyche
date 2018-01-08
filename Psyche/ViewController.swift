//
//  ViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 10/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    

    @IBOutlet weak var menu: UIImageView!
    
    
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: true) //hide the navigation bar
   
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
       
       
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        
        
      
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openMenuAction(_ sender: Any) {
    
        if(menuShowing){
            menuWidth.constant = -175
        }
        else{
            menuWidth.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing
    }
   
}

