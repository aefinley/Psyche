//
//  ViewController.swift
//  Psyche
//
//  Created by Petra Novakovic on 10/19/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    

    @IBOutlet weak var menu: UIImageView!

    
    @IBOutlet weak var nasaButton: UIButton!
    

    
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fasasf
        //hide the navigation controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
   
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
    
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        
        
        
        
      
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        
        getImages()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
        if(menuShowing){
            menuWidth.constant = -175
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
    @IBAction func openMenuAction(_ sender: Any) {
    
        if(menuShowing){
            menuWidth.constant = -175
        }
        else{
            menuWidth.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            view.layoutIfNeeded()
        }
        
        menuShowing = !menuShowing
    }
    
    @IBAction func closeMenu(_ sender: UIButton) {
        if(menuShowing){
            menuWidth.constant = -175
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
    
    
    
    //fetch images from website, store in core data
    
    var imageArray = [UIImage]()
    
     //To be used to fetch images
     func getImages(){
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
        
    } //end fetch images?
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is MediaGallery
        {
            let imgarr = segue.destination as? MediaGallery
            imgarr?.imgarr = imageArray
        }
    }
    
   
}




