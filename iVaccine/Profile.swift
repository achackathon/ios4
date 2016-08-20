//
//  Profile.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Profile: NSManagedObject {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

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

  func loadVaccines() {
    let vaccines = DataModule.sharedInstance.getVaccine(nil)

    for vaccine in vaccines {
      let vaccineRecord = VaccineRecord.newVaccineRecord(self.managedObjectContext!)
      vaccineRecord.profile = self
      vaccineRecord.vaccineted = false
      vaccineRecord.vaccine = vaccine

      vaccineRecord.save()
    }
  }

  func save() {
    do {
      try self.appDelegate.saveContext()
    } catch {
      print("Não foi possível salvar a vacina \(self.name).")
    }
  }
}
