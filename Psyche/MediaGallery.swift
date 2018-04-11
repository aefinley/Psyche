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
    
    
    //for menu
    var menuShowing = false //boolean to see if menu is showing currently or not
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
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

    
    
    
    
}





