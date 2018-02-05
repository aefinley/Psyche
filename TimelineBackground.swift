//
//  TimelineBackground.swift
//  Psyche
//
//  Created by TempGuest on 2/5/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

//@IBDesignable
class TimelineBackground: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    

    override func draw(_ rect: CGRect) {
        //let color = UIColor(
        let lightOrange = UIColor(red: 251/255, green: 158/255, blue: 1/255, alpha: 1.0)
        let darkOrange = UIColor(red: 245/255, green: 113/255, blue: 51/255, alpha: 1.0)
        let pink = UIColor(red: 239/255, green: 89/255, blue: 101/255, alpha: 1.0)
        let purple = UIColor(red: 167/255, green: 62/255, blue: 92/255, alpha: 1.0)
        let lineWidth: CGFloat = 1.0
        let path = UIBezierPath(rect: rect)
        let path2 = UIBezierPath(rect: rect)
        let path3 = UIBezierPath(rect: rect)
        path.lineWidth = lineWidth
        // finding the size of the screen
        let screenWidth = bounds.width
        let screenHeight = bounds.height
        
        //light orange line
        //UIColor.red.setStroke()
        lightOrange.setStroke()
        
        path.move(to: CGPoint(x: 0, y: screenHeight / 5))
        path.addLine(to: CGPoint(x: screenWidth, y: screenHeight / 5))
        
        path.stroke()
        
        //dark orange line
        path2.move(to: CGPoint(x: 0, y: 2*screenHeight / 5))
        path2.addLine(to: CGPoint(x: screenWidth, y: 2*screenHeight / 5))
        darkOrange.setStroke()
        path2.stroke()
        
        //pink line
        path3.move(to: CGPoint(x: 0, y: 3*screenHeight / 5))
        path3.addLine(to: CGPoint(x: screenWidth, y: 3*screenHeight / 5))
        pink.setStroke()
        path3.stroke()
        /*
        // purple line
        path.move(to: CGPoint(x: 0, y: 4*screenHeight / 5))
        path.addLine(to: CGPoint(x: screenWidth, y: 4*screenHeight / 5))
        purple.setStroke()
        path.stroke()
        
        */
        
        
        /*let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
        */
    }
    
    
}
