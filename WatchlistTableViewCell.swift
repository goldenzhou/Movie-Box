//
//  WatchlistTableViewCell.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/7/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class WatchlistTableViewCell: UITableViewCell {

    @IBOutlet weak var watchListMovie: UILabel!
    
    @IBOutlet weak var nailImage: UIImageView!
    
    var movieIndex: Int?

    var movie: String? {
        didSet {
            watchListMovie.text = movie
            var nstitles = NSUserDefaults.standardUserDefaults().stringArrayForKey("titles") as [String]
            movieIndex = find(nstitles, movie!)
            nailImage.image = UIImage(named: "0\(movieIndex! + 1).jpg")
        }
    }
    
}
