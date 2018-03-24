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
    
    
    //for the menu
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    @IBOutlet weak var menu: UIImageView!
    @IBOutlet weak var nasaButton: UIButton!
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //create a seperate video array.
    var imgarr:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    //num of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgarr.count //changed
    }
    
    //populate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = imgarr[indexPath.row] //changed
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 20
        
        
        return cell
        
    }
    
    
    //replace this and segue to a detailed view.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //var imagee = imgarr[indexPath.row]
        
        let imageView = UIImageView(image: imgarr[indexPath.row])
        imageView.frame =  self.view.bounds //self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
 
    
    
    
    
    
    // Use to back from full mode
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
   
    
}





