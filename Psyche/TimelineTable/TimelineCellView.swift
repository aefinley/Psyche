//
//  TimelineCellView.swift
//  Psyche
//
//  Created by Jennifer on 3/26/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class TimelineCellView: UIView {
    
    var firstColor:UIColor!
    var secondColor:UIColor!
    
    override func draw(_ rect: CGRect) {
        
        // finding the size of the screen
        let screenWidth = self.bounds.width
        let screenHeight = self.bounds.height
        
        let context = UIGraphicsGetCurrentContext()!
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [firstColor.cgColor, secondColor.cgColor]
        let locations:[CGFloat] =   [0.0, 1.0]
        let start = CGPoint(x: screenWidth / 5, y: 0.0)
        let end = CGPoint(x: screenWidth / 5, y: screenHeight)
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)!
        
        context.drawRadialGradient(gradient, startCenter: start, startRadius: 1, endCenter: end, endRadius: 1, options: [])
        
        
    }
}

