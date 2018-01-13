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
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    
        
        self.dataSource = TWTRUserTimelineDataSource(screenName: "NASAPsyche", apiClient: client)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()// Dispose of any resources that can be recreated.
    }
    
   
}
