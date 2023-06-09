//
//  StrainParent+CoreDataProperties.swift
//  Terp
//
//  Created by Andrew on 6/7/23.
//
//

import Foundation
import CoreData


extension StrainParent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StrainParent> {
        return NSFetchRequest<StrainParent>(entityName: "StrainParent")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var strain: Strain?

}

extension StrainParent : Identifiable {

}
