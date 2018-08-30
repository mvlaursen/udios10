//
//  Contact+CoreDataProperties.swift
//  PhoneBook
//
//  Created by Mike Laursen on 8/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
