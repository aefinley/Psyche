//
//  TimelineBackgroundControllerViewController.swift
//  Psyche
//
//  Created by Jennifer on 2/12/18.
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
    
    
    @IBOutlet weak var menu: UIImageView!
    
    
    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    
  var menuShowing = false
    
    var labelArray:[UILabel] = [UILabel]()
    var buttonArray:[UIButton] = [UIButton]()
    var axisArray:[CGFloat] = [CGFloat]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem?.title = "TO TIMELINE"
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if(menuShowing){
            menuWidth.constant = -300
        }
       
    }

    
    
    @IBAction func openMenu(_ sender: UIButton) {
         sender.shake()
        if(menuShowing){
            menuWidth.constant = -300
        }
        else{
            menuWidth.constant = -5
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        if(menuShowing){
            menuWidth.constant = -300
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
            menuShowing = false
        }
    }
    
    @IBAction func openNasa(_ sender: Any) {
        
        if let url = URL(string: "http://nasa.gov/psyche"){
            
            
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
        }
    }
    
    @IBAction func openASU(_ sender: Any) {
        if let url = URL(string: "http://psyche.asu.edu"){
            
            
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("open url: \(success)")
            }) //open url when link clicked
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //gesture created so if user clicks on outside view menu will close
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.closeMenu))
        
        self.view.addGestureRecognizer(gesture)
        
        
        //hide the navigation controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        
        menuWidth.constant = -300 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
       menu.image = #imageLiteral(resourceName: "menuImage")
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
        
        
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
    
    
    
    @IBAction func goToAR(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "3DPicker") as! ARPickerController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func goToGallery(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mediaGallery") as! MediaGallery
        self.present(nextViewController, animated:true, completion:nil)
        
    }

    @IBAction func goToExplore(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Explore") as! MissionFactsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    

    @IBAction func unwindToTimelineBackgroundViewController(segue: UIStoryboardSegue) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func transition(_ sender: Any) {
        performSegue(withIdentifier: "segueToTable", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TimelineTableController {
            let send = sender as! UIButton
            dest.button = send.tag
        }
    }
 
    

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}


}

