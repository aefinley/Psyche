//
//  DetailViewController.swift
//  Psyche
//
//  Created by Timothy Cook on 4/6/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class MediaDetailViewController: UIViewController {
    
    //next image button
    @IBAction func nextImage(_ sender: Any) {
        
        if row! < max! - 1 {
            img.image = imgArr[row! + 1]
            row = row! + 1
            
            //thumbnails
            if row! < max! - 1 {
                nextImageView.image = imgArr[row!+1]
            }
            
           prevImageView.image = imgArr[row!-1]
            
            
        }
        
    }
    
    //previous image button
    @IBAction func prevImage(_ sender: Any) {
        
        if row! > 0 {
            img.image = imgArr[row! - 1]
            row = row! - 1
            
            
            //thumbnails
            if row! > 0 {
                prevImageView.image = imgArr[row!-1]
            }
            
            nextImageView.image = imgArr[row!+1]
        }
        
    }
    
    //variables used to fetch/navigate image array
    @IBOutlet weak var img: UIImageView!
    var image = UIImage()
    var imgArr:[UIImage] = []
    var indexPath: IndexPath?
    var trow:Int?
    var max:Int?
    lazy var row = trow
    
    //nextImage and prevImage thumbnails
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var prevImageView: UIImageView!
    var nextImage = UIImage()
    var prevImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = image
        
        //for a fullscreen
        //img.frame = self.view.bounds
        
        img.backgroundColor = .black
        img.contentMode = .center
        img.isUserInteractionEnabled = true
        img.contentMode = UIViewContentMode.scaleAspectFit
        
        //If the user selects the last image from collectionview
        if row! < max! - 1 {
            nextImageView.image = imgArr[row!+1]//nextImage
            nextImageView.contentMode = UIViewContentMode.scaleAspectFit
        }
        else {
            nextImageView.image = imgArr[row!]//nextImage
            nextImageView.contentMode = UIViewContentMode.scaleAspectFit
        }
        //If the user selects the very first image from collectionview
        if row! > 0 {
            prevImageView.image = imgArr[row!-1]//prevImage
            prevImageView.contentMode = UIViewContentMode.scaleAspectFit
        }
        else{
            prevImageView.image = imgArr[row!]//prevImage
            prevImageView.contentMode = UIViewContentMode.scaleAspectFit
        }
        
        nextImageView.backgroundColor = .black
        prevImageView.backgroundColor = .black
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
}
