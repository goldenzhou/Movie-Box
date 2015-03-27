//
//  DetailTableViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/5/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
        
    var movieDetail = MovieInfo()
    
    var index: Int?  {
        didSet {
            println(index!)
            movieData.removeAll()
            movieData.append("0\(index!+1).jpg")
            movieData.append(movieDetail.getTitle(index!))
            movieData.append(movieDetail.getTime(index!))
            movieData.append(movieDetail.getDirector(index!))
            movieData.append(movieDetail.getType(index!))
            movieData.append(movieDetail.getStars(index!))
            movieData.append(movieDetail.getScore(index!))
            movieData.append("Find a nearby theatre on map?")
        }
    }
    
    var movieData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if movieData[indexPath.section].hasSuffix(".jpg") {
            return 300
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieDetail.getCellTitle(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        title = movieDetail.getTitle(index!)
        if movieData[indexPath.section].hasSuffix(".jpg") {
            let cell = tableView.dequeueReusableCellWithIdentifier("Image", forIndexPath: indexPath) as ImageTableViewCell
            cell.Image.image = UIImage(named: movieData[indexPath.section])
            return cell
        } else if movieData[indexPath.section] == "Find a nearby theatre on map?" {
            let cell = tableView.dequeueReusableCellWithIdentifier("Map", forIndexPath: indexPath) as MapTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("Text", forIndexPath: indexPath) as TextTableViewCell
            cell.Text = movieData[indexPath.section]
            return cell

        }
        
    }
    
    
    @IBAction func addWatchlist(sender: UIButton) {
        
        if var watchlist = NSUserDefaults.standardUserDefaults().stringArrayForKey("watchlist") as? [String] {
            if contains(watchlist, movieData[1]) == false {
                watchlist.append(movieData[1])
                NSUserDefaults.standardUserDefaults().setObject(watchlist, forKey: "watchlist")
            }
            
        } else {
            NSUserDefaults.standardUserDefaults().setObject([movieData[1]], forKey: "watchlist")
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        let alert = UIAlertController(title: "Add to Watchlist Successfully", message: movieData[1], preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPageView" {
                let cell = sender as ImageTableViewCell
                if let indexPath = tableView.indexPathForCell(cell) {
                    let seguedToMVC = segue.destinationViewController as ViewController
                    seguedToMVC.index = index! + 1
                }
        } else if segue.identifier == "showMap" {
            let cell = sender as MapTableViewCell
            if let indexPath = tableView.indexPathForCell(cell) {
                let seguedToMVC = segue.destinationViewController as GPXViewController
                seguedToMVC.movieName = movieData[1]
            }
        } else {
            if let seguedToMVC = segue.destinationViewController as? RecomViewController {
                if let ppc = seguedToMVC.popoverPresentationController {
                    ppc.delegate = self
                }
                findSimilarMovie()
                var tmp: String = "Similar movies are:\n"
                var count = 1
                for movie in similarmovies {
                    tmp += "\(count). " + movie + ".\n"
                    count++
                }
                seguedToMVC.text = tmp
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    var similarmovies = [String]()
    
    func findSimilarMovie() {
        similarmovies.removeAll()
        var types = movieData[4].componentsSeparatedByString(" | ")
        for(var i = 0; i < movieDetail.movieName.count; i++ ) {
            for type in types {
                if(movieDetail.movietype[i].rangeOfString(type) != nil && movieDetail.movieName[i] != movieData[1]) {
                    similarmovies.append(movieDetail.movieName[i])
                    break
                }

            }
        }
    }

    
}
