//
//  UpcomingPageContentViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/9/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class UpcomingPageContentViewController: UIViewController {

    @IBOutlet var upImageView: UIImageView!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = upImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.upImageView.image = UIImage(named: imageName)
    }

}
