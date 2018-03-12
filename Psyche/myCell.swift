//
//  myCell.swift
//  Psyche
//
//  Created by Timothy Cook on 3/10/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

@IBDesignable class myCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
