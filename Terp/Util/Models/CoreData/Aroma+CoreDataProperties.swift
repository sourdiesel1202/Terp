//
//  Aroma+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/3/23.
//
//

import Foundation
import CoreData


extension Aroma {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Aroma> {
        return NSFetchRequest<Aroma>(entityName: "Aroma")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var terpenes: Terpene?

}

extension Aroma : Identifiable {

}
