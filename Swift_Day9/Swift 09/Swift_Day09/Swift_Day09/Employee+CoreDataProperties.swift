//
//  Employee+CoreDataProperties.swift
//  Swift_Day09
//
//  Created by TUYENBQ on 10/19/15.
//  Copyright © 2015 TUYENBQ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employee {

    @NSManaged var employee_id: String?
    @NSManaged var employee_name: String?
    @NSManaged var employee_gender: NSNumber?
    @NSManaged var company_id: String?
    @NSManaged var relationship: Company?

}
