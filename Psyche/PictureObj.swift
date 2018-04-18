import Foundation
import CoreData

public class PictureObj: NSManagedObject {
    @NSManaged public var pic: Data
    
    static func add(pic: Data, context: NSManagedObjectContext) -> Data {
        let ent = NSEntityDescription.entity(forEntityName: "PictureObj", in: context)
        let newItem = PictureObj(entity: ent!, insertInto: context)
        newItem.pic = pic
        do{ try context.save() }
        catch _ {}
        return newItem.pic
    }
    
    static func getAll(context: NSManagedObjectContext) -> [Data]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PictureObj")
        let objs = (try? context.fetch(fetchRequest)) as? [PictureObj]
        if objs!.count > 0 {
            var rpics = [Data]()
            for pic in objs! { rpics.append(pic.pic) }
            return rpics
        } else { return nil }
    }
    
    static func remove(context: NSManagedObjectContext, ID: NSManagedObjectID){
        context.delete(context.object(with: ID))
        do{ try context.save() }
        catch _ {}
    }
}
