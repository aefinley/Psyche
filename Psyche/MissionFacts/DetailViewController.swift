//
//  DetailViewController.swift
//  Psyche
//
//  Created by Allison Finley on 2/13/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class DetailViewController: UIViewController {
    var selectedFact:efact!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    @IBOutlet weak var factImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedFact.factName!
        descLabel.text = selectedFact.factDescription!
        factImage.image = selectedFact.factImage
        
    }
    
}
