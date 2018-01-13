//
//  SocialController.swift
//  Psyche
//
//  Created by NA on 1/5/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
import TwitterKit

class SocialController: TWTRTimelineViewController{
    
    let client = TWTRAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0) 
        
        self.dataSource = TWTRUserTimelineDataSource(screenName: "NASAPsyche", apiClient: client)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()// Dispose of any resources that can be recreated.
    }
    
   
}
