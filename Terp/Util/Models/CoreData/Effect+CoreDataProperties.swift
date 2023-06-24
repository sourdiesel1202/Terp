//
//  Effect+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/15/23.
//
//

import Foundation
import CoreData


extension Effect {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Effect> {
        return NSFetchRequest<Effect>(entityName: "Effect")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var terpenes: Set<Terpene>?

}

// MARK: Generated accessors for terpenes
extension Effect {

    @objc(addTerpenesObject:)
    @NSManaged public func addToTerpenes(_ value: Terpene)

    @objc(removeTerpenesObject:)
    @NSManaged public func removeFromTerpenes(_ value: Terpene)

    @objc(addTerpenes:)
    @NSManaged public func addToTerpenes(_ values: NSSet)

    @objc(removeTerpenes:)
    @NSManaged public func removeFromTerpenes(_ values: NSSet)

}

extension Effect : Identifiable {

}
