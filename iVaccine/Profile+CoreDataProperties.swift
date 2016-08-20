//
//  Profile+CoreDataProperties.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import CoreData
import Foundation

extension Profile {
  @NSManaged var birthdate: NSDate
  @NSManaged var name: String
  @NSManaged var sex: String
  @NSManaged var vaccineRecords: NSSet?
}
