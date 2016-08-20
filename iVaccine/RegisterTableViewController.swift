//
//  RegisterViewController.swift
//  iVaccine
//
//  Created by Ids Tecnologia  on 8/20/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
import UIKit


enum SexCategory : String {
    case Male = "male", Female = "female", NotDefined = "notDefined"
}

class RegisterTableViewController : UITableViewController {
    
     let maleEmojiRespresention : String = "👱"
     let femaleEmojiRespresention : String = "👩"
     let notDefinedEmojiRespresention: String = "👻"



    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var male: SexButton!
    @IBOutlet weak var female: SexButton!
    @IBOutlet weak var notDefined: SexButton!
    
    let dataModule = DataModule.sharedInstance
    var birthday = NSDate()
    var sex = SexCategory.NotDefined
    
    var isFormEditing : Bool = false
    
    override func viewDidLoad() {
        
        name.delegate = self
        birthdate.delegate = self
        
        navigationController?.title = "Register"
        
        male.title = maleEmojiRespresention
        female.title = femaleEmojiRespresention
        notDefined.title = notDefinedEmojiRespresention
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        birthdate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RegisterTableViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        birthday = sender.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        birthdate.text = dateFormatter.stringFromDate(sender.date)
    }
    
    
  
    
    @IBAction func selectSex(sender: SexButton) {
        
        male.backgroundColor = UIColor.grayColor()
        female.backgroundColor = UIColor.grayColor()
        notDefined.backgroundColor = UIColor.grayColor()

        //not good at all
        switch (sender.titleLabel!.text)! {
            case maleEmojiRespresention : sex = .Male
            case femaleEmojiRespresention : sex = .Female
            default: sex = .NotDefined
        }
        
        sender.backgroundColor = UIColor.redColor()
        
    }
    
    @IBAction func goNext(sender: UIBarButtonItem) {
        
        print("Save " + name.text!)
        
        let newProfile = Profile.newProfile(dataModule.managedObjectContext)
        
        newProfile.name = name.text!
        newProfile.birthdate = birthday
        newProfile.sex = sex.rawValue
        
        
        //set profile
        performSegueWithIdentifier("SegueSchedule", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueSchedule" {
            
            
            
        }
    }
    
    
}



public class SexButton: UIButton {
    
    var title : String = "" {
        didSet {
            setTitle(title, forState: .Normal)
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitialization()
    }
    public func sharedInitialization(){
        layer.cornerRadius = frame.width/2
        backgroundColor = UIColor.grayColor()
        self.titleLabel?.font = .systemFontOfSize(45)
        //setTitle("💩", forState: .Normal)
    }
}

extension RegisterTableViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        isFormEditing = true
        addViewToDismiss()
    }
    func textFieldDidEndEditing(textField: UITextField) {
        isFormEditing = false
    }
}

extension UIViewController {
    func addViewToDismiss() {
        let viewTapToDismiss = UIView.init(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
        viewTapToDismiss.tag = 1234
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.handleTap(_:)))
        viewTapToDismiss.addGestureRecognizer(tap)
        view.addSubview(viewTapToDismiss)
        
    }
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        for viewSearch in view.subviews {
            if viewSearch.tag == 1234 {
                viewSearch.removeFromSuperview()
            }
        }
        self.view.endEditing(true)
    }
}

//extension RegisterTableViewController : UITableViewDelegate {
//    
//}
//
//extension RegisterTableViewController : UITableViewDataSource {
//    
//}