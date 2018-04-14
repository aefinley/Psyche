//
//  Fact+CoreDataProperties.swift
//  Psyche
//
//  Created by Allison Finley on 2/26/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//
// Implementation 

import Foundation
import CoreData


extension Fact {

   // @nonobjc public class func fetchRequest() -> NSFetchRequest<Fact> {
   //     return NSFetchRequest<Fact>(entityName: "Fact")
   // }

    @NSManaged  var categoryType: String
    @NSManaged  var desc: String
    @NSManaged  var image: Data
    @NSManaged  var title: String
    @NSManaged  var date: String
    @NSManaged  var timeImage: Data

    public func add(title:String, desc:String, categoryType:String, image:UIImage) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Fact", in: context)
        let newFact = NSManagedObject(entity: entity!, insertInto: context)
        
        
        newFact.setValue(title, forKey: "title")
        newFact.setValue(desc, forKey: "desc")
        newFact.setValue(categoryType, forKey: "catgoryType")
        newFact.setValue(image, forKey: "image")
        
        //get a handler to the Contacts entity through the managed object context
        _ = NSEntityDescription.entity(forEntityName: "Fact", in: managedObjectContext!)
        
        // create a contact object instance for insert
        let fact = Fact() //entity: ent!, insertInto: managedObjectContext!
        
        // add data to each field in the entity
        fact.title = title
        fact.desc = desc
        fact.image = (UIImagePNGRepresentation(image) as Data?)!
        fact.categoryType = categoryType
        
        // save the new entity
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}
