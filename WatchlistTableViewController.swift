//
//  WatchlistTableViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/7/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class WatchlistTableViewController: UITableViewController {

    var movieList: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()

        if var watchlist = NSUserDefaults.standardUserDefaults().stringArrayForKey("watchlist") as? [String] {
            movieList.removeAll()
            movieList = watchlist
        } else {
            NSUserDefaults.standardUserDefaults().setObject([], forKey: "watchlist")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Watchlist", forIndexPath: indexPath) as WatchlistTableViewCell
        
        cell.movie = movieList[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if let deleteRecents = NSUserDefaults.standardUserDefaults().stringArrayForKey("watchlist") as? [String] {
                var newHistory = deleteRecents
                newHistory.removeAtIndex(find(newHistory, movieList[indexPath.row])!)
                movieList.removeAtIndex(indexPath.row)
                NSUserDefaults.standardUserDefaults().setObject(movieList, forKey: "watchlist")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
            //            viewDidLoad()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } /*else if editingStyle == .Insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Rating" {
            let cell = sender as WatchlistTableViewCell
            if let indexPath = tableView.indexPathForCell(cell) {
                let seguedToMVC = segue.destinationViewController as RatingTableViewController
                seguedToMVC.movie = movieList[indexPath.row]
            }
        }
    }




}
