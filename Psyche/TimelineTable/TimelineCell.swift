//
//  TimelineCell.swift
//  Psyche
//
//  Created by Jennifer on 3/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var diamond: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pictureForEvent: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

