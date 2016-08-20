//
//  RangeAge.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import CoreData
import Foundation

class RangeAge: NSManagedObject {
  class func newRangeAge(managedObjectContext: NSManagedObjectContext) -> RangeAge {
    return NSEntityDescription.insertNewObjectForEntityForName("RangeAge", inManagedObjectContext: managedObjectContext) as! RangeAge
  }

  static func findOrCreate(managedObjectContext: NSManagedObjectContext, ageInit: Int, ageFinal: Int) -> RangeAge? {
    // Initialize Fetch Request
    let entity = NSEntityDescription.entityForName("RangeAge", inManagedObjectContext: managedObjectContext)
    let fetchRequest = NSFetchRequest()
    fetchRequest.entity = entity

    // Add filter
    let predicate = NSPredicate(format: "init = %@ AND final = %@", String(ageInit), String(ageFinal))
    fetchRequest.predicate = predicate

    do {
      let ranges = try managedObjectContext.executeFetchRequest(fetchRequest) as? [RangeAge]

      if let range = ranges?.first {
        return range
      } else {
        let range = RangeAge.newRangeAge(managedObjectContext)
        range.ageInit = ageInit
        range.ageFinal = ageFinal

        try! range.managedObjectContext?.save()

        return range
      }
    } catch {
      let _ = error as NSError
    }

    return nil
  }
}
