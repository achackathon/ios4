//
//  ProfilesTableViewController.swift
//  iVaccine
//
//  Created by Ids Tecnologia  on 8/20/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import UIKit

class Profile : NSObject {
    
    var name : String = ""
    var age : String = ""
    
    func initWith(name : String, age: String) {
        self.name = name
        self.age = age
    }
    
    
}

class ProfilesTableViewController : UITableViewController {
    
    let listOfProfiles : [Profile] = []
        
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        
    }
    @IBAction func create(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier("SegueRegister", sender: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let userSelected =  listOfUsers[indexPath.row]
        //
        //        delegate?.selectedUser(userSelected)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3//listOfProfiles.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ProfileTableViewCell = tableView.dequeueReusableCellWithIdentifier("ProfileTableViewCell") as! ProfileTableViewCell
        //let profile = listOfProfiles[indexPath.row]
        //cell.lableName.text = user.name
        cell.name.text = "Nome de Alguem"
        cell.age.text = "22 anos"
        
        return cell;
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
//    override func table
//    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "✂️" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            print("Delete")
        })
        
       
//        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(45)] as Dictionary!
//        UIButton.appearance().setAttributedTitle(NSAttributedString(string: "   ✏️   ", attributes: attributes), forState: .Normal)
        
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "✏️" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            print("Edit")
        })
        
        deleteAction.backgroundColor = UIColor.redColor()//UIColor.whiteColor()
        editAction.backgroundColor = UIColor.whiteColor()
        
       
        
        //deleteAction.title.

        
       // deleteAction.back
        //NSDictionary *systemAttributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:18] };

       // self.titleLabel?.font = .systemFontOfSize(45)


        return [deleteAction,editAction]
    }

}

class ProfileTableViewCell : UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
}

