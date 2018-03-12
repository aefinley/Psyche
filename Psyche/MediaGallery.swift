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
    
   // var imageArray = [UIImage]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //create a seperate video array.
    
    let imgArray:[String] = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10",
        "image11","image12","image13","image14","image15","image16","image17","image18","image19","image20",
        "image21","image22","image23","image24","image25","image26","image27","image28","image29","image30",
        "image31","image32","image33","image34","image35","image36","image37","image38","image39","image40",
        "image41","image42","image43","image44"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //add another - clickable sections for image/videos
        
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        myCollectionView.collectionViewLayout = layout
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //num of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //populate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = UIImage(named: imgArray[indexPath.row] + ".jpg")
        cell.layer.borderWidth = 1.1
        cell.layer.cornerRadius = 12
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageView = UIImageView(image: UIImage(named: imgArray[indexPath.row] + ".jpg"))
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
