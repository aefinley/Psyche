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
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    @IBOutlet weak var dayTitle: UILabel!
    @IBOutlet weak var hourTitle: UILabel!
    @IBOutlet weak var minuteTitle: UILabel!
    
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
        
        // one minute has passed, modify the count down time and update the UI
        
        let launch = Date(timeIntervalSinceReferenceDate: nextEvent)
        let currentTime = Date()
        let timeComponents = Calendar.current.dateComponents([.year, .day, .hour, .minute], from: currentTime, to: launch)
        let year:Int = timeComponents.year!
        let day:Int = timeComponents.day!
        let hour:Int = timeComponents.hour!
        let minute:Int = timeComponents.minute!
        
        yearLabel.text = (String)(format: "%02d", year)
        dayLabel.text = (String)(format: "%03d", day)
        hourLabel.text = (String)(format: "%02d", hour)
        minuteLabel.text = (String)(format: "%02d", minute)
        
        let fontSizeNumbers = 0.18666666666 * self.view.frame.width
        
        for i in 0..<countdownLabels.count {
            var boxWidth:CGFloat = 10 * fontSizeNumbers / 12
            
            if i == 1 {
                boxWidth *= 1.5333
            }
            
            let boxHeight:CGFloat = (6 * fontSizeNumbers / 7)
            let size = CGSize(width: boxWidth, height: boxHeight)
            
            countdownLabels[i].frame.size = size
            
            countdownTitles[i].center.x = countdownLabels[i].center.x
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
        countdownLabels = [yearLabel, dayLabel, hourLabel, minuteLabel]
        
        // change the sizes/fonts of the the titles and the clock
        let fontSizeNumbers = 0.18666666666 * self.view.frame.width
        let startNum:CGFloat = -1.6
        let numChars:CGFloat = 7
        let space = abs(startNum / (numChars * 1.5))
        
        xBounds = [ startNum, 6*space + startNum, 15*space + startNum, 21*space + startNum]
        
        for i in 0..<countdownLabels.count {
            countdownLabels[i].font = UIFont(name: "Knockout", size: fontSizeNumbers)
            countdownLabels[i].frame.origin.y = 49 * self.view.frame.size.height / 200
            
            countdownLabels[i].frame.origin.x = (xBounds[i] + 2.3) * fontSizeNumbers
        }
        
        let fontSizeTitles = 0.02213541666 * self.view.frame.width
        
        for i in 0..<countdownTitles.count {
            let title = countdownTitles[i]
            title.frame.origin.y = countdownLabels[i].center.y - (countdownLabels[i].frame.height / 2) - 2 * fontSizeTitles
            title.font = UIFont(name: "Helvetica", size: fontSizeTitles)
            title.sizeToFit()
            title.center.x = countdownLabels[i].center.x
            
        }
        
            //dnaflk
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
            
            getImages()
        }
            
            
            
    
    
    //fetch images from website, store in core data
    
    var imageArray = [UIImage]()
    
     //To be used to fetch images
     func getImages(){
        print("fetching images now. loading..")
        var pagedata:String = ""
        var i = 1, added = 16
        while added == 16 {
            added=0
            let url: URL = URL(string: "https://psyche.asu.edu/galleries/images/page/" + String(i))!
            do{
                try pagedata = String(contentsOf: url)
            } catch _ {}
            let arr = pagedata.split(separator: "<")
            var findend=false
            finder: for str in arr {
                if findend{
                    let stri = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                    if stri == "/section>" {
                        break finder
                    }
                    if stri.hasPrefix("img") {
                        var looker = stri.split(separator: " ")[3]
                        var end = looker.suffix(5)
                        looker = looker.prefix(upTo: looker.index(looker.endIndex, offsetBy: -13)) + end
                        //print(looker)
                        do{
                            try imageArray.append(UIImage(data: Data(contentsOf: URL(string: String(looker.suffix(from: looker.index(looker.startIndex, offsetBy: 5))).trimmingCharacters(in: CharacterSet(charactersIn: "\"")))!))!)
                        } catch _ {}
                        added+=1
                    }
                }
                if str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "section class=\"gallery-grid container\">" {
                    findend=true
                }
            }
            i+=1
        }
        print("done fetching images")
        
        } //end fetch images
       
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is MediaGallery
        {
            let imgarr = segue.destination as? MediaGallery
            imgarr?.imgarr = imageArray
        }
    }
    
   
}




func unwindToHomeScreen(segue: UIStoryboardSegue) {
    }



