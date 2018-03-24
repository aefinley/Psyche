//
//  facts.swift
//  Psyche
//
//  Created by Allison Finley on 2/11/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class facts {
    var facts:[fact] = []
    
    init() {
        let f1 = fact()
        let f2 = fact()
        let f3 = fact()
    }
    
}

class fact {
    
    var factName: String?
    var factDescription: String?
    var factImageName: String?
    
    init(fn:String, fd:String, fin:String) {
        factName = fn
        factDescrition = fd
        factImageName: fin
    }
}
