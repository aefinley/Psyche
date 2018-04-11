//
//  ViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 10/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    

    
    @IBOutlet weak var menu: UIImageView!

    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var nasaButton: UIButton!
    
    @IBOutlet weak var yearTitle: UILabel!
    @IBOutlet weak var dayTitle: UILabel!
    @IBOutlet weak var hourTitle: UILabel!
    @IBOutlet weak var minuteTitle: UILabel!
    
    
    @IBOutlet weak var countdownTitle: UILabel!
    @IBOutlet weak var countdownTitle2: UILabel!
    @IBOutlet weak var countdownTitle3: UILabel!
    @IBOutlet weak var countdownTitle4: UILabel!
    
    var menuShowing = false //boolean to see if menu is showing currently or not
    var countdownTimer:Timer!
    var nextEvent:TimeInterval = 681004800 // time from Jan. 1 2001 to Aug. 1 2022
    var countdownLabels:[UILabel] = []
    var xBounds:[CGFloat] = []
    var countdownTitles:[UILabel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
        if(menuShowing){
           menuWidth.constant = -300
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to open nasa.gov link when nasa.gov button is selected
    @IBAction func openNasa(_ sender: UIButton) {
        
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
    
    
    
    @IBAction func openMenuAction(_ sender: Any) {
    
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
    
    @IBAction func closeMenu(_ sender: UIButton) {
        if(menuShowing){
            menuWidth.constant = -300
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
            menuShowing = false
        }
    }
    
    @IBAction func redirect(_ sender: UIBarButtonItem) {
        var url:URL
        switch sender.tag {
        case 0:
            url = URL(string: "https://www.facebook.com/NASAPsyche")!
        case 1:
            url = URL(string: "https://www.twitter.com/NASAPsyche")!
        case 2:
            url = URL(string: "https://www.instagram.com/nasapsyche")!
        default:
            url = URL(string: "https://www.google.com")!
        }
        UIApplication.shared.open(url, options: [:])
    }
    
    // must expose this function to objective c
    @objc func countdownChanged() {
        
        // modify the count down time and update the UI
        
        let launch = Date(timeIntervalSinceReferenceDate: nextEvent)
        let currentTime = Date()
        let timeComponents = Calendar.current.dateComponents([.year, .day, .hour, .minute], from: currentTime, to: launch)
        let year:Int = timeComponents.year!
        let day:Int = timeComponents.day!
        let hour:Int = timeComponents.hour!
        let minute:Int = timeComponents.minute!
        
        countdownTitle.text = (String)(format: "%02d", year)
        countdownTitle2.text = (String)(format: "%03d", day)
        countdownTitle3.text = (String)(format: "%02d", hour)
        countdownTitle4.text = (String)(format: "%02d", minute)
        
        for count in countdownLabels {
            count.sizeToFit()
            
        }
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //close menu if user clicks on main view
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
        
        // starts the count down timer, executes countdownChanged every second
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownChanged), userInfo: nil, repeats: true)
        countdownChanged()
        
        // move the countdown labels to their correct positions
        countdownTitles = [yearTitle, dayTitle, hourTitle, minuteTitle]
        countdownLabels = [countdownTitle, countdownTitle2, countdownTitle3, countdownTitle4]

        // change the sizes/fonts of the the titles and the clock
        let fontSizeNumbers = 0.18666666666 * self.view.frame.width
        xBounds = [ -1.25, -0.4167, 0.4167, 1.25]
        
        for i in 0..<countdownLabels.count {
            countdownLabels[i].font = UIFont(name: "Knockout", size: fontSizeNumbers)
            countdownLabels[i].center.y = self.view.frame.size.height / 3
            countdownLabels[i].sizeToFit()
            countdownLabels[i].center.x = self.view.center.x + xBounds[i] * fontSizeNumbers        }
        
        let fontSizeTitles = 0.02213541666 * self.view.frame.width
        
        for i in 0..<countdownTitles.count {
            let title = countdownTitles[i]
            title.frame.origin.y = countdownLabels[i].center.y - (countdownLabels[i].frame.height / 2) - fontSizeTitles
            title.font = UIFont(name: "Helvetica", size: fontSizeTitles)
            title.sizeToFit()
            title.center.x = countdownLabels[i].center.x
            
        }
       
        menuButton.addTarget(self, action: #selector(ViewController.openMenuAction(_:)), for: UIControlEvents.touchUpInside)
        
        //gesture created so if user clicks on outside view menu will close
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.closeMenu))
        
        self.view.addGestureRecognizer(gesture)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
    
        menuWidth.constant = -300 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImage")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
    }

}

