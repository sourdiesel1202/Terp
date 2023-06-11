//
//  Terpene+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/10/23.
//
//

import Foundation
import CoreData


extension Terpene {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Terpene> {
        return NSFetchRequest<Terpene>(entityName: "Terpene")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var aromas: Set<Aroma>?
    @NSManaged public var effects: Set<Effect>?
    @NSManaged public var strains: Set<Strain>?

}

// MARK: Generated accessors for aromas
extension Terpene {

    @objc(addAromasObject:)
    @NSManaged public func addToAromas(_ value: Aroma)

    @objc(removeAromasObject:)
    @NSManaged public func removeFromAromas(_ value: Aroma)

    @objc(addAromas:)
    @NSManaged public func addToAromas(_ values: NSSet)

    @objc(removeAromas:)
    @NSManaged public func removeFromAromas(_ values: NSSet)

}

// MARK: Generated accessors for effects
extension Terpene {

    @objc(addEffectsObject:)
    @NSManaged public func addToEffects(_ value: Effect)

    @objc(removeEffectsObject:)
    @NSManaged public func removeFromEffects(_ value: Effect)

    @objc(addEffects:)
    @NSManaged public func addToEffects(_ values: NSSet)

    @objc(removeEffects:)
    @NSManaged public func removeFromEffects(_ values: NSSet)

}

// MARK: Generated accessors for strains
extension Terpene {

    @objc(addStrainsObject:)
    @NSManaged public func addToStrains(_ value: Strain)

    @objc(removeStrainsObject:)
    @NSManaged public func removeFromStrains(_ value: Strain)

    @objc(addStrains:)
    @NSManaged public func addToStrains(_ values: NSSet)

    @objc(removeStrains:)
    @NSManaged public func removeFromStrains(_ values: NSSet)

}

extension Terpene : Identifiable {

}
