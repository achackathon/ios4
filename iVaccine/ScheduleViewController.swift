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
    
    var profile : Profile!
        
    var list  = [VaccinesPerAgeRange]()
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        list = DataModule.sharedInstance.getVaccinePerAgeRange(profile)
        tableView.reloadData()
        
    }
    
    @IBAction func showProfiles(sender: UIBarButtonItem) {
        performSegueWithIdentifier("SegueProfiles", sender: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 5//list.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       // let vaccinePerAgeRange = list[section]
        
        return 5//vaccinePerAgeRange.vaccines.count
        
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView.init(frame: CGRectMake(0, 0, view.frame.width, 50))
        
         let titleHeader = UILabel.init(frame: CGRectMake(view.frame.width/2 - 100, 0, 200, viewHeader.frame.height))
        titleHeader.textAlignment = .Center
        titleHeader.font = .systemFontOfSize(25)
        titleHeader.textColor = UIColor.whiteColor()

        //let vaccinePerAgeRange = list[section]

        titleHeader.text = "1 a 2 anos"//vaccinePerAgeRange.description
        titleHeader.backgroundColor = UIColor.clearColor()
        viewHeader.backgroundColor = UIColor.grayColor()
        
        viewHeader.addSubview(titleHeader)
        
        return viewHeader
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : VaccineTableViewCell = tableView.dequeueReusableCellWithIdentifier("VaccineTableViewCell") as! VaccineTableViewCell
        cell.selectedIcon.alpha = 0.5
        cell.selectionStyle = .None
        
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Selected")
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! VaccineTableViewCell
        cell.showSelected()
        
        
    }

    
    
}




class VaccineTableViewCell : UITableViewCell {
    @IBOutlet weak var descriptionVaccine: UILabel!
    @IBOutlet weak var selectedIcon: UILabel!
    
    @IBAction func showDetails(sender: UIButton) {
        
        
    }
    
    func showSelected(){
        print("anima")
        if selectedIcon.alpha < 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.selectedIcon.alpha = 1.0
            })
        }else {
            UIView.animateWithDuration(0.5, animations: {
                self.selectedIcon.alpha = 0.5
            })
            
        }
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)
        
//        UIView.animateWithDuration(0.5, animations: {
//           self.selectedIcon.alpha = 1.0
//        })
    }
    
}