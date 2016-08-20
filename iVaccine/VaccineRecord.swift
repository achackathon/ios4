//
//  VaccineRecord.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import CoreData


class VaccineRecord: NSManagedObject {
  class func newVaccineRecord(managedObjectContext: NSManagedObjectContext) -> VaccineRecord {
    return NSEntityDescription.insertNewObjectForEntityForName("VaccineRecord", inManagedObjectContext: managedObjectContext) as! VaccineRecord
  }

  func addVaccineObject(value: Vaccine) {
    let items = self.mutableSetValueForKey("vaccine");
    items.addObject(value)
  }

  func removeVaccineObject(value: Vaccine) {
    let items = self.mutableSetValueForKey("vaccine");
    items.removeObject(value)
  }
}
