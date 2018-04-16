//
//  Fact+CoreDataProperties.swift
//  Psyche
//
//  Created by Jennifer on 4/15/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension Fact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fact> {
        return NSFetchRequest<Fact>(entityName: "Fact")
    }

    @NSManaged public var categoryType: String?
    @NSManaged public var date: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: NSData?
    @NSManaged public var timelineImage: NSData?
    @NSManaged public var title: String?
    @NSManaged public var timelineEvent: Int32

}
