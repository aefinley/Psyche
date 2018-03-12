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
    
    var imageArray: [UIImage] = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        getImages()
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return imageArray.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! imageCollectionViewCell
        cell.imageview.image = imageArray[indexPath.row]
        return cell
    }
    
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
                        let looker = stri.split(separator: " ")[3]
                        //var end = looker.suffix(5)
                        //looker = looker.prefix(upTo: looker.index(looker.endIndex, offsetBy: -13)) + end
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
        }    }
}
