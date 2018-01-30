//
//  HomeController.swift
//  Psyche
//
//  Created by NA on 1/29/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
        print(sender.tag)
    }
}
