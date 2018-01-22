//
//  MediaGallery.swift
//  Psyche
//
//  Created by Timothy Cook on 1/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class MediaGallery: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray: [UIImage] = [ UIImage[named "1"]!, UIImage[named "2"]!, UIImage[named "3"]!, UIImage[named "4"]!, UIImage[named "5"]!, UIImage[named "6"]!, UIImage[named "7"]!, UIImage[named "8"]!, UIImage[named "9"]! ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! imageCollectionViewCell
        
        let object = imageArray[indexPath.item]
        cell.imageView.image = image

        
        //let image = UIImage(named: "myImageName")
        //cell.imageView.image = image
        
        return cell
    }
    
    
}
