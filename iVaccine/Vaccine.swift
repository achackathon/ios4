//
//  Vaccine.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import CoreData
import Foundation

class Vaccine: NSManagedObject {
  class func newVaccine(managedObjectContext: NSManagedObjectContext) -> Vaccine {
    return NSEntityDescription.insertNewObjectForEntityForName("Vaccine", inManagedObjectContext: managedObjectContext) as! Vaccine
  }

  func addRangeObject(value: RangeAge) {
    let items = self.mutableSetValueForKey("rangeAge");
    items.addObject(value)
  }

  func removeRangeObject(value: RangeAge) {
    let items = self.mutableSetValueForKey("rangeAge");
    items.removeObject(value)
  }
}
