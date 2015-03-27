//
//  SettingsTableViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/12/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let search = NSUserDefaults.standardUserDefaults().stringForKey("searchKey") {
            searchKeyword.text = search
        }
        if let multi = NSUserDefaults.standardUserDefaults().stringForKey("multi") {
            repeatLabel.text = multi
        }
    }
    
    @IBOutlet weak var repeatLabel: UILabel!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func repeatingChanged(sender: UIStepper) {
        repeatLabel.text = Int(sender.value).description
        NSUserDefaults.standardUserDefaults().setObject(Int(sender.value).description, forKey: "multi")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func clearWatchlist(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setObject([], forKey: "watchlist")
        NSUserDefaults.standardUserDefaults().synchronize()
        let alert = UIAlertController(title: "Clear Watchlist Successfully", message: nil, preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var radiusLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func SliderChanged(sender: UISlider) {
        var currentValue = sender.value
        NSUserDefaults.standardUserDefaults().setObject("\(sender.value)", forKey: "radius")
        NSUserDefaults.standardUserDefaults().synchronize()
        radiusLabel.text = "\(currentValue)"

    }
    
    @IBOutlet weak var searchKeyword: UITextField! {
        didSet {
            searchKeyword.delegate = self
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NSUserDefaults.standardUserDefaults().setObject(textField.text, forKey: "searchKey")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        textField.resignFirstResponder()
        return true
    }

    


}
