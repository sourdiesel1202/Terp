//
//  Terpene+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/3/23.
//
//

import Foundation
import CoreData


extension Terpene {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Terpene> {
        return NSFetchRequest<Terpene>(entityName: "Terpene")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var effects: Set<Effect>?
    @NSManaged public var aromas: Set<Aroma>?

}

// MARK: Generated accessors for effects
extension Terpene {

    @objc(addEffectsObject:)
    @NSManaged public func addToEffects(_ value: Effect)

    @objc(removeEffectsObject:)
    @NSManaged public func removeFromEffects(_ value: Effect)

    @objc(addEffects:)
    @NSManaged public func addToEffects(_ values: Set<Effect>)

    @objc(removeEffects:)
    @NSManaged public func removeFromEffects(_ values: Set<Effect>)

}

// MARK: Generated accessors for aromas
extension Terpene {

    @objc(addAromasObject:)
    @NSManaged public func addToAromas(_ value: Aroma)

    @objc(removeAromasObject:)
    @NSManaged public func removeFromAromas(_ value: Aroma)

    @objc(addAromas:)
    @NSManaged public func addToAromas(_ values: Set<Aroma>)

    @objc(removeAromas:)
    @NSManaged public func removeFromAromas(_ values: Set<Aroma>)

}

extension Terpene : Identifiable {

}
