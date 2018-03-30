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
    
   
  
        override func viewWillAppear(_ animated: Bool) {
          
            
    self.navigationController?.setNavigationBarHidden(false, animated: true)
                    }
   


@IBAction func unwindToARPickerController(segue: UIStoryboardSegue) {
}
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! ARViewController
    
    
    if (segue.identifier == "viewAsteroid"){
        
        destination.sentValue = 0
    }
    else if(segue.identifier == "viewSatellite"){
        destination.sentValue = 1
    }
    
}

    
}

