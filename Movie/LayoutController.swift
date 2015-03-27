//
//  LayoutController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/5/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class LayoutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    let titles = ["Chappie", "The Second Best Exotic Marigold Hotel", "Unfinished Business", "Merchants of Doubt", "Compared to What: The Improbable Journey of Barney Frank", "Fifty Shades of Grey", "Kingsman: The Secret Service", "The SpongeBob Movie: Sponge Out of Water", "McFarland, USA", "The DUFF", "American Sniper", "Hot Tub Time Machine 2", "Jupiter Ascending", "The Imitation Game", "Paddington"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNSdefault()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    var multi = 3
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let mul = NSUserDefaults.standardUserDefaults().stringForKey("multi") {
            multi = mul.toInt()!
        }
        return titles.count * multi
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CollectionViewCell
        cell.movieTitle.text = self.titles[indexPath.row % titles.count]
        let curr = indexPath.row % titles.count  + 1
        let imgName = "0\(curr).jpg"
        cell.pinImage.image = UIImage(named: imgName)
        
        return cell
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 170, height: 300)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
        println(sender)
        if(segue.identifier == "detail"){
            let cell = sender as CollectionViewCell
            let indexPath = collectionView?.indexPathForCell(cell)
            let vc = segue.destinationViewController as DetailTableViewController
            
            let curr = indexPath!.row % titles.count
            vc.index = curr
            
        }
    }
    
    func setNSdefault() {
        var ratings = NSUserDefaults.standardUserDefaults().stringArrayForKey("ratings")
        if ratings == nil {
            var ratingcopy = [String]()
            for(var i = 0; i < titles.count; i++) {
                ratingcopy.append("0")
            }
            NSUserDefaults.standardUserDefaults().setObject(ratingcopy, forKey: "ratings")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        var reviews = NSUserDefaults.standardUserDefaults().stringArrayForKey("reviews")
        if reviews == nil {
            var reviewcopy = [String]()
            for(var i = 0; i < titles.count; i++) {
                reviewcopy.append("")
            }
            NSUserDefaults.standardUserDefaults().setObject(reviewcopy, forKey: "reviews")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        var nstitles = NSUserDefaults.standardUserDefaults().stringArrayForKey("titles")
        if nstitles == nil {
            NSUserDefaults.standardUserDefaults().setObject(titles, forKey: "titles")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        var radius = NSUserDefaults.standardUserDefaults().stringForKey("radius")
        if radius == nil {
            NSUserDefaults.standardUserDefaults().setObject("0.5", forKey: "radius")
            NSUserDefaults.standardUserDefaults().synchronize()
        }

        var search = NSUserDefaults.standardUserDefaults().stringForKey("searchKey")
        if search == nil {
            NSUserDefaults.standardUserDefaults().setObject("Movie theatre", forKey: "searchKey")
            NSUserDefaults.standardUserDefaults().synchronize()
        }

        var multi = NSUserDefaults.standardUserDefaults().stringForKey("multi")
        if multi == nil {
            NSUserDefaults.standardUserDefaults().setObject("3", forKey: "multi")
            NSUserDefaults.standardUserDefaults().synchronize()
        }

    
    }
}
