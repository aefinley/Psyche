//
//  FactTableViewCell.swift
//  Psyche
//
//  Created by Allison Finley on 2/13/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factDescription: UITextView!
    @IBOutlet weak var factTitle: UILabel!
    @IBOutlet weak var factImage: UIImageView!{
        didSet {
            //images in cells have rounded edges
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue" {
            let dest = segue.destination as! DetailViewController
            dest.titleLabel = factTitle
            dest.factImage = factImage
            dest.descLabel = factDescription
        }
    }
    
    
}
