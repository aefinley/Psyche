//
//  ClockBoxes.swift
//  Psyche
//
//  Created by jkrause7 on 4/11/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class ClockBoxes: UIView {

    var xBounds:[CGFloat] = []
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        xBounds = [ -1.25, -0.4167, 0.4167, 1.25]
        let fontSizeNumbers = 0.18666666666 * self.frame.width
        let purple = UIColor(red: 90/255, green: 37/255, blue: 83/255, alpha: 1.0)
        
        // draw the clock boxes
        
        for i in 0..<xBounds.count {

            let boxWidth:CGFloat = 9 * fontSizeNumbers / 12
            let boxHeight:CGFloat = ( 4 * fontSizeNumbers / 5 )
            let boxHeightHalf = boxHeight / 2
            
            let startX:CGFloat = ( (xBounds[i] + 2.3) * fontSizeNumbers )
            let startY1:CGFloat = ( 49 * self.frame.size.height / 200 )
            let startY2 = startY1 + boxHeightHalf + 2 // num of pixels in between the boxes
            let myRect1 = CGRect(x: startX, y: startY1, width: boxWidth, height: boxHeightHalf)
            
            let path = UIBezierPath(rect: myRect1)
            purple.setFill() // need to change to pink color
            path.fill()
            
            let myRect2 = CGRect(x: startX, y: startY2, width: boxWidth, height: boxHeightHalf)
            let path2 = UIBezierPath(rect:myRect2)
            path2.fill()
        }
        
    }
 

}
