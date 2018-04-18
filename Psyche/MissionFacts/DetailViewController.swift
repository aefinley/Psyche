//
//  DetailViewController.swift
//  Psyche
//
//  Created by Allison Finley on 2/13/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class DetailViewController: UIViewController {
    
    var selectedFact:Fact!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    @IBOutlet weak var factImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // back button is viewable
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        titleLabel.text = selectedFact.title
        descLabel.text = selectedFact.desc
        factImage.image = UIImage(data: selectedFact.image as! Data)
    }
    
}
