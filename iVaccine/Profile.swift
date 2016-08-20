//
//  Profile.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import CoreData


class Profile: NSManagedObject {
  class func newProfile(managedObjectContext: NSManagedObjectContext) -> Profile {
    return NSEntityDescription.insertNewObjectForEntityForName("Profile", inManagedObjectContext: managedObjectContext) as! Profile
  }

  func addVaccineRecordObject(value: VaccineRecord) {
    let items = self.mutableSetValueForKey("vaccineRecords");
    items.addObject(value)
  }

  func removeVaccineRecordObject(value: VaccineRecord) {
    let items = self.mutableSetValueForKey("vaccineRecords");
    items.removeObject(value)
  }
}
