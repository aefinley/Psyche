//
//  TimelineViewController.swift
//  Psyche
//
//  Created by Allison Finley on 1/18/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController {
    
    override func viewDidLoad() {
        // set background to purple
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        // memory stuff
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func menuPress(_ sender: Any) {
         self.navigationController?.setNavigationBarHidden(false, animated: true)
        // todo
    }
    
    @IBAction func firstTimeline(_ sender: Any) {
        
    }
    
    
    
}
