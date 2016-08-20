//
//  ScheduleViewController.swift
//  iVaccine
//
//  Created by Ids Tecnologia  on 8/20/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController : UITableViewController {
    
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    @IBAction func showProfiles(sender: UIBarButtonItem) {
        performSegueWithIdentifier("SegueProfiles", sender: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 4
        
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView.init(frame: CGRectMake(0, 0, view.frame.width, 60))
        
         let titleHeader = UILabel.init(frame: CGRectMake(view.frame.width/2 - 100, 5, 200, viewHeader.frame.height-5))
        titleHeader.textAlignment = .Center
        titleHeader.font = .systemFontOfSize(30)

         titleHeader.text = "123 meses"
        titleHeader.backgroundColor = UIColor.yellowColor()
        viewHeader.backgroundColor = UIColor.redColor()
        
        viewHeader.addSubview(titleHeader)
        
        return viewHeader
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : VaccineTableViewCell = tableView.dequeueReusableCellWithIdentifier("VaccineTableViewCell") as! VaccineTableViewCell
        
        return cell
        
    }

    
    
}




class VaccineTableViewCell : UITableViewCell {
    
}