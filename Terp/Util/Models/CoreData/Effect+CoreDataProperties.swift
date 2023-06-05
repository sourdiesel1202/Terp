//
//  Effect+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/3/23.
//
//

import Foundation
import CoreData


extension Effect {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Effect> {
        return NSFetchRequest<Effect>(entityName: "Effect")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var terpenes: Terpene?

}

extension Effect : Identifiable {

}
