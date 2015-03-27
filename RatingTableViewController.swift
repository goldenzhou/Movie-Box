//
//  RatingTableViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/8/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController, UITextFieldDelegate {
    
    var movie: String? {
        didSet {
            var nstitles = NSUserDefaults.standardUserDefaults().stringArrayForKey("titles") as [String]
            movieIndex = find(nstitles, movie!)
        }
    }
    
    var movieIndex: Int?
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var movieRating: UIStepper!
    
    @IBAction func ratingChanged(sender: UIStepper) {
        ratingLabel.text = Int(sender.value).description
        var ratings = NSUserDefaults.standardUserDefaults().stringArrayForKey("ratings") as [String]
        ratings[movieIndex!] = Int(sender.value).description
        NSUserDefaults.standardUserDefaults().setObject(ratings, forKey: "ratings")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    @IBOutlet weak var addReview: UITextField! {
        didSet {
            addReview.delegate = self
            addReview.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        reviewLabel.text = textField.text
        var reviews = NSUserDefaults.standardUserDefaults().stringArrayForKey("reviews") as [String]
        reviews[movieIndex!] = textField.text
        NSUserDefaults.standardUserDefaults().setObject(reviews, forKey: "reviews")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieRating.wraps = true
        movieRating.autorepeat = true
        movieRating.maximumValue = 5
        
        if let index = movieIndex {
            var ratings = NSUserDefaults.standardUserDefaults().stringArrayForKey("ratings") as [String]
            ratingLabel.text = ratings[index]
            var reviews = NSUserDefaults.standardUserDefaults().stringArrayForKey("reviews") as [String]
            reviewLabel.text = reviews[index]
        }
    }

}
