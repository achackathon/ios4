//
//  ScheduleViewController.swift
//  iVaccine
//
//  Created by Ids Tecnologia  on 8/20/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController : UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    @IBAction func showProfiles(sender: UIBarButtonItem) {
        performSegueWithIdentifier("SegueProfiles", sender: nil)
    }
    
    
}
