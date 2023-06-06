//
//  Strain+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/5/23.
//
//

import Foundation
import CoreData


extension Strain {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Strain> {
        return NSFetchRequest<Strain>(entityName: "Strain")
    }

    @NSManaged public var aliases: String?
    @NSManaged public var url: String?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: String?
    @NSManaged public var type: String?
    @NSManaged public var image: String?
    @NSManaged public var parents: Set<Strain>?
    @NSManaged public var children: Set<Strain>?
    @NSManaged public var terpenes: Set<Terpene>?

}

// MARK: Generated accessors for parents
extension Strain {

    @objc(addParentsObject:)
    @NSManaged public func addToParents(_ value: Strain)

    @objc(removeParentsObject:)
    @NSManaged public func removeFromParents(_ value: Strain)

    @objc(addParents:)
    @NSManaged public func addToParents(_ values: NSSet)

    @objc(removeParents:)
    @NSManaged public func removeFromParents(_ values: NSSet)

}

// MARK: Generated accessors for children
extension Strain {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: Strain)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: Strain)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

// MARK: Generated accessors for terpenes
extension Strain {

    @objc(addTerpenesObject:)
    @NSManaged public func addToTerpenes(_ value: Terpene)

    @objc(removeTerpenesObject:)
    @NSManaged public func removeFromTerpenes(_ value: Terpene)

    @objc(addTerpenes:)
    @NSManaged public func addToTerpenes(_ values: NSSet)

    @objc(removeTerpenes:)
    @NSManaged public func removeFromTerpenes(_ values: NSSet)

}

extension Strain : Identifiable {

}
