//
//  DataModule.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import UIKit
import CoreData
import Foundation

final class DataModule {
  static let sharedInstance = DataModule()

  let managedObjectContext: NSManagedObjectContext!

  private init() {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    self.managedObjectContext = appDelegate.managedObjectContext

    loadVaccine()
  }

  private func loadVaccine() {
    let loaded = NSUserDefaults.standardUserDefaults().boolForKey("loaded")

    if loaded {
      return
    }

    let privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
    privateManagedObjectContext.parentContext = managedObjectContext

    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
      if let json = self.loadJsonFrom(resource: "Vaccine", ofType: "json") {
        guard let vaccines = json[""] as? [[String: NSObject]] else { return }

        for vaccineJson in vaccines {
          guard let name = vaccineJson["name"] as? String else { continue }
          guard let ranges = vaccineJson["ranges"] as? [[String: NSObject]] else { continue }

          let vaccine = Vaccine.newVaccine(privateManagedObjectContext)
          vaccine.name = name

          for rangeJson in ranges {
            guard let initialValue = rangeJson["init"] as? Int,
              let finalValue = rangeJson["final"] as? Int else {
                print("Não foi possível ler os dados do range da vacina \(name)")
                continue
            }

            if let range = RangeAge.findOrCreate(privateManagedObjectContext, ageInit: initialValue, ageFinal: finalValue) {
              vaccine.addRangeObject(range)
            } else {
              continue
            }
          }

          do {
            try vaccine.managedObjectContext?.save()
          } catch {
            print((error as NSError).localizedDescription)
          }
        }
      } else {
        print("Não foi possível carregar os dados de vacina.")
      }

      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "loaded")
    }
  }

  private func loadJsonFrom(resource resource: String, ofType: String) -> [String: NSObject]? {
    let path = NSBundle.mainBundle().pathForResource(resource, ofType: ofType)!

    do {
      let data = try NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)

      return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: NSObject]
    } catch {
      print("\((error as NSError).userInfo)")
    }
    
    return nil
  }
}

extension DataModule {
  func getRanges(initInMonths: Int = 0, finalInMonths: Int = 11988) -> [RangeAge] {
    // Initialize Fetch Request
    let entity = NSEntityDescription.entityForName("RangeAge", inManagedObjectContext: managedObjectContext)
    let fetchRequest = NSFetchRequest()
    fetchRequest.entity = entity

    // Add filter
    let predicate = NSPredicate(format: "init = %@ AND final = %@", String(initInMonths), String(finalInMonths))
    fetchRequest.predicate = predicate

    do {
      return try managedObjectContext.executeFetchRequest(fetchRequest) as! [RangeAge]
    } catch {
      print((error as NSError).localizedDescription)
    }

    return [RangeAge]()
  }

  func getProfiles(name: String?) -> [Profile] {
    // Initialize Fetch Request
    let entity = NSEntityDescription.entityForName("Profile", inManagedObjectContext: managedObjectContext)
    let fetchRequest = NSFetchRequest()
    fetchRequest.entity = entity

    // Add filter
    if let name = name {
      let predicate = NSPredicate(format: "name = %@", name)
      fetchRequest.predicate = predicate
    }

    do {
      return try managedObjectContext.executeFetchRequest(fetchRequest) as! [Profile]
    } catch {
      print((error as NSError).localizedDescription)
    }

    return [Profile]()
  }

  func getVaccine(name: String?) -> [RangeAge] {
    // Initialize Fetch Request
    let entity = NSEntityDescription.entityForName("RangeAge", inManagedObjectContext: managedObjectContext)
    let fetchRequest = NSFetchRequest()
    fetchRequest.entity = entity

    // Add filter
    if let name = name {
      let predicate = NSPredicate(format: "name = %@", name)

      fetchRequest.predicate = predicate
    }

    do {
      return try managedObjectContext.executeFetchRequest(fetchRequest) as! [RangeAge]
    } catch {
      print((error as NSError).localizedDescription)
    }

    return [RangeAge]()
  }

  func getVaccineRecord(profile: Profile, vaccineted: Bool?) -> [VaccineRecord] {
    // Initialize Fetch Request
    let entity = NSEntityDescription.entityForName("VaccineRecord", inManagedObjectContext: managedObjectContext)
    let fetchRequest = NSFetchRequest()
    fetchRequest.entity = entity

    // Add filter
    let predicate = NSPredicate(format: "profile.name = %@ AND profile.birthdate = %@", profile.name, profile.birthdate)
    fetchRequest.predicate = predicate

    if let vaccineted = vaccineted {
      let predicate = NSPredicate(format: "vaccineted == %@ AND profile.name = %@ AND profile.birthdate = %@", vaccineted, profile.name, profile.birthdate)
      fetchRequest.predicate = predicate
    }

    do {
      return try managedObjectContext.executeFetchRequest(fetchRequest) as! [VaccineRecord]
    } catch {
      print((error as NSError).localizedDescription)
    }

    return [VaccineRecord]()
  }
}
