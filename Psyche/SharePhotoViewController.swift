//
//  SharePhotoViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 3/28/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
class SharePhotoViewController: UIViewController {
   

    var sentimage: UIImage?

    @IBOutlet weak var sentImageView: UIImageView!
    
    

    
    
    @IBAction func savePhoto(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(sentImageView.image!, nil, nil, nil) //save photo to gallery
        
        let alertController = UIAlertController(title: "Psyche", message:
            "Photo Successfully Added to Library!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      
        super.viewWillAppear(animated)
        
       
        
    
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
       
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
   self.sentImageView.image = sentimage
       
        
      
        
        
    
       
    }
    
}


