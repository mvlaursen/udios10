//
//  Entity+CoreDataProperties.swift
//  PhotoBase
//
//  Created by Mike Laursen on 8/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var descr: String?
    @NSManaged public var image: NSData?
    @NSManaged public var title: String?

}
