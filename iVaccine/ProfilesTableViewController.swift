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
    
}

class ProfilesTableViewController : UITableViewController {
    
    let listOfProfiles : [Profile] = []
        
    override func viewDidLoad() {
        
        
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


}

class ProfileTableViewCell : UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
}

