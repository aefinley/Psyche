//
//  MediaGallery.swift
//  Psyche
//
//  Created by Timothy Cook on 1/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class MediaGallery: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var menuButton: UIButton!
    
    
    @IBOutlet weak var menu: UIImageView!
    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    //for menu
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var imgarr:[UIImage] = []
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if(menuShowing){
            menuWidth.constant = -300
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
    
    
    @IBAction func goToTimeline(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Timeline") as! TimelineBackgroundControllerViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func goHome(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func goToExplore(_ sender: Any) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Explore") as! MissionFactsViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
    @IBAction func goToAr(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "3DPicker") as! ARPickerController
        self.present(nextViewController, animated:true, completion:nil)

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
        
        
        //close menu if user clicks on main view
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.1843, green: 0.1255, blue: 0.2745, alpha: 1.0)  //this code was generated online, I had to find the exact RGB values for deep purple background color
        
        menuWidth.constant = -175 //menu should be hidden when view loads, width is 300 so needs to be -300
        
        menu.layer.shadowOpacity = 1
        menu.layer.shadowRadius = 5
        menu.image = #imageLiteral(resourceName: "menuImageFlipped")
        //self.menu.bringSubview(toFront: menu); //makes sure menu view does not get mixed with twitter feed
        
        self.menu.layer.zPosition = 1 //ensures that menu view is on top of the main view
        self.view.bringSubview(toFront: menu)
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
        
        
        
        
        
        
        
        
        
        
        //back button
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let itemSize = UIScreen.main.bounds.width/2 - 6
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 60, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 12
        
        myCollectionView.collectionViewLayout = layout
        
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgarr.count
    }
    
    //populate cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = imgarr[indexPath.row]
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 20
        return cell
        
    }
    
    //for selecting specific images in the collectionview
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //display detail view in DetailViewController
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destView = mainStoryBoard.instantiateViewController(withIdentifier: "MediaDetailViewController") as! MediaDetailViewController
        destView.image = imgarr[indexPath.row]
        
        //sets imgarr, indexPath, and row in the DetailViewController
        destView.imgArr = imgarr
        destView.indexPath = indexPath
        destView.trow = indexPath.row
        
        let max = imgarr.count
        destView.max = max
        
        self.navigationController?.pushViewController(destView, animated: true)
        
        
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

    
    
    
    
}





