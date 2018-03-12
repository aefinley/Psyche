//
//  TimelineBackgroundControllerViewController.swift
//  Psyche
//
//  Created by TempGuest on 2/12/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
@IBDesignable
class TimelineBackgroundControllerViewController: UIViewController {

    @IBOutlet weak var orangeButton1: UIButton!
    @IBOutlet weak var orangeButton2: UIButton!
    @IBOutlet weak var darkOrangeButton1: UIButton!
    @IBOutlet weak var darkOrangeButton2: UIButton!
    @IBOutlet weak var pinkButton1: UIButton!
    @IBOutlet weak var pinkButton2: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    @IBOutlet weak var darkPurple1: UIButton!
    @IBOutlet weak var darkPurple2: UIButton!
    @IBOutlet weak var darkPurple3: UIButton!
    @IBOutlet weak var darkPurple4: UIButton!
    
    
    var labelArray:[UILabel] = [UILabel]()
    var buttonArray:[UIButton] = [UIButton]()
    var axisArray:[CGFloat] = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         labelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9, label10]
        buttonArray = [orangeButton1, orangeButton2, darkOrangeButton1, darkOrangeButton2, pinkButton1, pinkButton2, darkPurple1, darkPurple2, darkPurple3, darkPurple4]
       axisArray = [2*view.bounds.width, 8*view.bounds.width, 4*view.bounds.width, 12*view.bounds.width, 1*view.bounds.width, 10*view.bounds.width, 2*view.bounds.width, 8*view.bounds.width, 4*view.bounds.width, 12*view.bounds.width]
       
        var num:CGFloat
        var intNum:Int
        
        for i in 1...10 {
            intNum = (i+1)/2
            num = CGFloat(intNum)
            
            buttonArray[i - 1].frame = CGRect(x: (axisArray[i - 1]/16), y: (num)*(view.bounds.height)/6 - 26, width: 51, height: 51)
            
            labelArray[i - 1].frame.origin.x = (axisArray[i - 1]/16) + 5
            labelArray[i - 1].frame.origin.y = (num*view.bounds.height/6 - 25.5) + 51
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
