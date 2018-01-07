//
//  SocialController.swift
//  Psyche
//
//  Created by NA on 1/5/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
import TwitterKit

class SocialController: UIViewController{
    
    let client = TWTRAPIClient()
    
    @IBOutlet var Tweet: TWTRTweetView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Twitter.sharedInstance().start(withConsumerKey: "tzMhH05lzEgNcAn4EB48CPnFA", consumerSecret: "6GYaAVzcGCM3f3OabouqFrM2H0SBFt7hcQzO60HxGV6mIbtomJ")
        client.loadTweet(withID: "949406863413555200") { (tweet, error) in
            if let t = tweet {
                self.Tweet.configure(with: t)
            } else {
                print("Failed to load Tweet: \(error!.localizedDescription)")
            }
        }    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()// Dispose of any resources that can be recreated.
        
    }
}
