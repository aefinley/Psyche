//
//  ViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 10/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var menuViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menu: UIView!
    
    
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openMenuAction(_ sender: Any) {
    
        if(menuShowing){
            menuViewLeadingConstraint.constant = -150
        }
        else{
            menuViewLeadingConstraint.constant = 0
            
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing
    }
   
}

