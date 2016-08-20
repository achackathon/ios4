//
//  DataModule.swift
//  iVaccine
//
//  Created by Mateus Gustavo de Freitas e Silva on 20/08/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation

class DataModule {
  static let sharedInstance = DataModule()

  func getRanges(initInMonths: Int = 0, finalInMonths: Int = 11988) -> [RangeAge] { return [RangeAge]() }
  func getProfiles(name: String?) -> [Profile] { return [Profile]() }
  func getVaccine(name: String?, ranges: [RangeAge]?) -> [Vaccine] { return [Vaccine]() }
  func getVaccineRecord(profile: Profile, vaccineted: Bool?) -> [VaccineRecord] { return [VaccineRecord]() }
}
