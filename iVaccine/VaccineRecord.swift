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

  func save() {
    do {
      try self.managedObjectContext?.save()
    } catch {
      print("Não foi possível salvar o registro de vacina para a vacina \(vaccine!.name) no profile do \(self.profile!.name).")
    }
  }
}
