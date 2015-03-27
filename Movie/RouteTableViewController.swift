//
//  RouteTableViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/7/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit
import MapKit

class RouteTableViewController: UITableViewController {
    
    var routes: [MKRoute]? {
        didSet {
            for(var i = 0; i < routes!.count; i++) {
                result[i].append("Distance from here:              " + routes![i].distance.description + " m")
                result[i].append("Expected travel time:           " + routes![i].expectedTravelTime.description + " s")
            }
        }
    }
    var theatres: [MKMapItem]? {
        didSet {
            result.removeAll()
            for(var i = 0; i < theatres!.count; i++) {
                let tmp = [String]()
                result.append(tmp)
                result[i].append(theatres![i].name)
                result[i].append("Phone:                            " + theatres![i].phoneNumber)
            }

        }
    }
    var result: [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return result.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return result[0].count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Theatre \(section + 1)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("Route", forIndexPath: indexPath) as RouteTableViewCell
            cell.RouteLabel.text = result[indexPath.section][indexPath.row]
            return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSpecRoute" {
            let cell = sender as RouteTableViewCell
            if let indexPath = tableView.indexPathForCell(cell) {
                let seguedToMVC = segue.destinationViewController as GPXViewController
                seguedToMVC.routeIndex = indexPath.section
            }
        }
    }
    
}
