//
//  StrainChild+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/7/23.
//
//

import Foundation
import CoreData


extension StrainChild {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StrainChild> {
        return NSFetchRequest<StrainChild>(entityName: "StrainChild")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var strain: Strain?

}

extension StrainChild : Identifiable {

}
